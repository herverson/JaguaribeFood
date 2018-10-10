defmodule JfWeb.UserController do
  use JfWeb, :controller

  plug Ueberauth
  alias Jf.Accounts
  alias Jf.Accounts.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)

    signin conn, changeset
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: produto_path(conn, :index))
  end

  defp signin(conn, changeset) do
    case Accounts.insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Bem vindo!")
        |> put_session(:user_id, user.id)
        |> redirect(to: produto_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Erro ao entrar")
        |> redirect(to: produto_path(conn, :index))
    end
  end

end
