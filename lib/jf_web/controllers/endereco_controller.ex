defmodule JfWeb.EnderecoController do
  use JfWeb, :controller

  alias Jf.Enderecos
  alias Jf.Enderecos.Endereco

  def index(conn, _params) do
    enderecos = Enderecos.list_enderecos()
    render(conn, "index.html", enderecos: enderecos)
  end

  def new(conn, _params) do
    changeset = Enderecos.change_endereco(%Endereco{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"endereco" => endereco_params}) do
    case Enderecos.create_endereco(endereco_params) do
      {:ok, endereco} ->
        conn
        |> put_flash(:info, "Endereco criado com sucesso.")
        |> redirect(to: endereco_path(conn, :show, endereco))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    endereco = Enderecos.get_endereco!(id)
    render(conn, "show.html", endereco: endereco)
  end

  def edit(conn, %{"id" => id}) do
    endereco = Enderecos.get_endereco!(id)
    changeset = Enderecos.change_endereco(endereco)
    render(conn, "edit.html", endereco: endereco, changeset: changeset)
  end

  def update(conn, %{"id" => id, "endereco" => endereco_params}) do
    endereco = Enderecos.get_endereco!(id)

    case Enderecos.update_endereco(endereco, endereco_params) do
      {:ok, endereco} ->
        conn
        |> put_flash(:info, "Endereço alterado com sucesso.")
        |> redirect(to: endereco_path(conn, :show, endereco))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", endereco: endereco, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    endereco = Enderecos.get_endereco!(id)
    {:ok, _endereco} = Enderecos.delete_endereco(endereco)

    conn
    |> put_flash(:info, "Endereço deletado com sucesso.")
    |> redirect(to: endereco_path(conn, :index))
  end
end
