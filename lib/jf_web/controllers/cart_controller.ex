defmodule JfWeb.CartController do
  use JfWeb, :controller

  alias Jf.Vendas
  alias Jf.Vendas.Cart

  def index(conn, _params) do
    cart = Vendas.list_cart()
    render(conn, "index.html", cart: cart)
  end

  def new(conn, _params) do
    changeset = Vendas.change_cart(%Cart{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cart" => cart_params}) do
    case Vendas.create_cart(cart_params) do
      {:ok, cart} ->
        conn
        |> put_flash(:info, "Cart created successfully.")
        |> redirect(to: cart_path(conn, :show, cart))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cart = Vendas.get_cart!(id)
    render(conn, "show.html", cart: cart)
  end

  def edit(conn, %{"id" => id}) do
    cart = Vendas.get_cart!(id)
    changeset = Vendas.change_cart(cart)
    render(conn, "edit.html", cart: cart, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cart" => cart_params}) do
    cart = Vendas.get_cart!(id)

    case Vendas.update_cart(cart, cart_params) do
      {:ok, cart} ->
        conn
        |> put_flash(:info, "Cart updated successfully.")
        |> redirect(to: cart_path(conn, :show, cart))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cart: cart, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart = Vendas.get_cart!(id)
    {:ok, _cart} = Vendas.delete_cart(cart)

    conn
    |> put_flash(:info, "Cart deleted successfully.")
    |> redirect(to: cart_path(conn, :index))
  end
end
