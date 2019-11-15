defmodule JfWeb.PedidoController do
  use JfWeb, :controller

  alias Jf.Pedidos
  alias Jf.Pedidos.Pedido

  alias Jf.Vendas
  alias Jf.Vendas.Cart

  def index(conn, _params) do
    pedidos = Pedidos.list_pedidos()
    cart = Vendas.list_cart()
    render(conn, "index.html", pedidos: pedidos, cart: cart)
  end

  def new(conn, _) do
    cart = Vendas.list_cart()
    changeset = Pedidos.change_pedido(%Pedido{})
    render(conn, "new.html", changeset: changeset, cart: cart)
  end

  def create(conn, %{"pedido" => pedido_params}) do
    cart = Vendas.list_cart()
    case Pedidos.create_pedido(pedido_params) do
      {:ok, pedido} ->
        conn
        |> put_flash(:info, "Pedido created successfully.")
        |> redirect(to: pedido_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, cart: cart)
    end
  end

  def show(conn, %{"id" => id}) do
    cart = Vendas.list_cart()
    pedido = Pedidos.get_pedido!(id)
    render(conn, "show.html", pedido: pedido)
  end

  def edit(conn, %{"id" => id}) do
    cart = Vendas.list_cart()
    pedido = Pedidos.get_pedido!(id)
    changeset = Pedidos.change_pedido(pedido)
    render(conn, "edit.html", pedido: pedido, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pedido" => pedido_params}) do
    cart = Vendas.list_cart()
    pedido = Pedidos.get_pedido!(id)

    case Pedidos.update_pedido(pedido, pedido_params) do
      {:ok, pedido} ->
        conn
        |> put_flash(:info, "Pedido updated successfully.")
        |> redirect(to: pedido_path(conn, :show, pedido))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pedido: pedido, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart = Vendas.list_cart()
    pedido = Pedidos.get_pedido!(id)
    {:ok, _pedido} = Pedidos.delete_pedido(pedido)

    conn
    |> put_flash(:info, "Pedido deleted successfully.")
    |> redirect(to: pedido_path(conn, :index))
  end
end
