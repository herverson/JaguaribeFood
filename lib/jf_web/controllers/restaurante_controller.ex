defmodule JfWeb.RestauranteController do
  use JfWeb, :controller

  alias Jf.Restaurantes
  alias Jf.Restaurantes.Restaurante

  def index(conn, _params) do
    restaurantes = Restaurantes.list_restaurantes()
    render(conn, "index.html", restaurantes: restaurantes)
  end

  def new(conn, _params) do
    changeset = Restaurantes.change_restaurante(%Restaurante{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"restaurante" => restaurante_params}) do
    case Restaurantes.create_restaurante(restaurante_params) do
      {:ok, restaurante} ->
        conn
        |> put_flash(:info, "Restaurante criado com sucesso.")
        |> redirect(to: restaurante_path(conn, :show, restaurante))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    restaurante = Restaurantes.get_restaurante!(id)
    render(conn, "show.html", restaurante: restaurante)
  end

  def edit(conn, %{"id" => id}) do
    restaurante = Restaurantes.get_restaurante!(id)
    changeset = Restaurantes.change_restaurante(restaurante)
    render(conn, "edit.html", restaurante: restaurante, changeset: changeset)
  end

  def update(conn, %{"id" => id, "restaurante" => restaurante_params}) do
    restaurante = Restaurantes.get_restaurante!(id)

    case Restaurantes.update_restaurante(restaurante, restaurante_params) do
      {:ok, restaurante} ->
        conn
        |> put_flash(:info, "Restaurante alterado com sucesso.")
        |> redirect(to: restaurante_path(conn, :show, restaurante))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", restaurante: restaurante, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    restaurante = Restaurantes.get_restaurante!(id)
    {:ok, _restaurante} = Restaurantes.delete_restaurante(restaurante)

    conn
    |> put_flash(:info, "Restaurante deletado com sucesso.")
    |> redirect(to: restaurante_path(conn, :index))
  end
end
