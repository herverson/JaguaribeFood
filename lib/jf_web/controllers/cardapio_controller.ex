defmodule JfWeb.CardapioController do
  use JfWeb, :controller

  alias Jf.Cardapios
  alias Jf.Cardapios.Cardapio

  def index(conn, _params) do
    cardapios = Cardapios.list_cardapios()
    render(conn, "index.html", cardapios: cardapios)
  end

  def new(conn, _params) do
    changeset = Cardapios.change_cardapio(%Cardapio{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cardapio" => cardapio_params}) do
    case Cardapios.create_cardapio(cardapio_params) do
      {:ok, cardapio} ->
        conn
        |> put_flash(:info, "Cardapio created successfully.")
        |> redirect(to: cardapio_path(conn, :show, cardapio))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cardapio = Cardapios.get_cardapio!(id)
    render(conn, "show.html", cardapio: cardapio)
  end

  def edit(conn, %{"id" => id}) do
    cardapio = Cardapios.get_cardapio!(id)
    changeset = Cardapios.change_cardapio(cardapio)
    render(conn, "edit.html", cardapio: cardapio, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cardapio" => cardapio_params}) do
    cardapio = Cardapios.get_cardapio!(id)

    case Cardapios.update_cardapio(cardapio, cardapio_params) do
      {:ok, cardapio} ->
        conn
        |> put_flash(:info, "Cardapio updated successfully.")
        |> redirect(to: cardapio_path(conn, :show, cardapio))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cardapio: cardapio, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cardapio = Cardapios.get_cardapio!(id)
    {:ok, _cardapio} = Cardapios.delete_cardapio(cardapio)

    conn
    |> put_flash(:info, "Cardapio deleted successfully.")
    |> redirect(to: cardapio_path(conn, :index))
  end
end
