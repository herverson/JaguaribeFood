defmodule JfWeb.Plugs.RequireUser do
  import Plug.Conn
  import Phoenix.Controller

  alias JfWeb.Router.Helpers
  def init(_params) do

  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "Você não está logado.")
      |> redirect(to: Helpers.page_path(conn, :index))
      |> halt()
    end
  end
end
