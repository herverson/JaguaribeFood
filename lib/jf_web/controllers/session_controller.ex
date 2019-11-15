defmodule JfWeb.SessionController do
    use JfWeb, :controller
  
    alias Jf.Admins
  
    def new(conn, _params) do
      render(conn, "new.html")
    end
  
    def create(conn, %{"session" => auth_params}) do
      admin = Admins.get_by_username(auth_params["username"])
      case Comeonin.Bcrypt.check_pass(admin, auth_params["senha"]) do
      {:ok, admin} ->
        conn
        |> put_session(:current_admin_id, admin.id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: page_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "There was a problem with your username/password")
        |> render("new.html")
      end
    end
  
    def delete(conn, _params) do
      conn
      |> delete_session(:current_admin_id)
      |> put_flash(:info, "Signed out successfully.")
      |> redirect(to: page_path(conn, :index))
    end
  end