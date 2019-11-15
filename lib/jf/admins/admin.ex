defmodule Jf.Admins.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  schema "admins" do
    field :nome, :string
    field :senha, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:username, :senha])
    |> validate_required([:username, :senha])
    |> unique_constraint(:username)
    |> update_change(:senha, &Bcrypt.hashpwsalt/1)
  end
end
