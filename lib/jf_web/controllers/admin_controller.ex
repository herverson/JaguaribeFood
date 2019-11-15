defmodule JfWeb.AdminController do
  use JfWeb, :controller

  alias Jf.Admins
  alias Jf.Admins.Admin

  def index(conn, _params) do
    admins = Admins.list_admins()
    render(conn, "index.html", admins: admins)
  end

  def new(conn, _params) do
    changeset = Admins.change_admin(%Admin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"admin" => admin_params}) do
    case Admins.create_admin(admin_params) do
      {:ok, admin} ->
        conn
        |> put_flash(:info, "Usuário restaurante criado com sucesso.")
        |> put_session(:current_admin_id, admin.id)
        |> redirect(to: page_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    admin = Admins.get_admin!(id)
    render(conn, "show.html", admin: admin)
  end

  def edit(conn, %{"id" => id}) do
    admin = Admins.get_admin!(id)
    changeset = Admins.change_admin(admin)
    render(conn, "edit.html", admin: admin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "admin" => admin_params}) do
    admin = Admins.get_admin!(id)

    case Admins.update_admin(admin, admin_params) do
      {:ok, admin} ->
        conn
        |> put_flash(:info, "Admin updated successfully.")
        |> redirect(to: admin_path(conn, :show, admin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", admin: admin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin = Admins.get_admin!(id)
    {:ok, _admin} = Admins.delete_admin(admin)

    conn
    |> put_flash(:info, "Admin deleted successfully.")
    |> redirect(to: admin_path(conn, :index))
  end
end
