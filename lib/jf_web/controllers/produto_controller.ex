defmodule JfWeb.ProdutoController do
  use JfWeb, :controller

  alias Jf.Catalogo
  alias Jf.Catalogo.Produto
  plug JfWeb.Plugs.RequireUser when action in [:new]


  def index(conn, _params) do
    produtos = Catalogo.list_produtos()
    render(conn, "index.html", produtos: produtos)
  end

  def new(conn, _params) do
    changeset = Catalogo.change_produto(%Produto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"produto" => produto_params}) do
    case Catalogo.create_produto(produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto criado com sucesso.")
        |> redirect(to: produto_path(conn, :show, produto))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    produto = Catalogo.get_produto!(id)
    render(conn, "show.html", produto: produto)
  end

  def edit(conn, %{"id" => id}) do
    produto = Catalogo.get_produto!(id)
    changeset = Catalogo.change_produto(produto)
    render(conn, "edit.html", produto: produto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Catalogo.get_produto!(id)

    case Catalogo.update_produto(produto, produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto alterado com sucesso.")
        |> redirect(to: produto_path(conn, :show, produto))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", produto: produto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    produto = Catalogo.get_produto!(id)
    {:ok, _produto} = Catalogo.delete_produto(produto)

    conn
    |> put_flash(:info, "Produto deletado com sucesso.")
    |> redirect(to: produto_path(conn, :index))
  end
end
