defmodule JfWeb.PageController do
  use JfWeb, :controller
  
  alias Jf.Catalogo
  alias Jf.Catalogo.Produto

  def index(conn, _params) do
    produtos = Catalogo.list_produtos()
    render(conn, "index.html", produtos: produtos)
  end
end
