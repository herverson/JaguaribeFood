defmodule Jf.Repo.Migrations.CreatePedidos do
  use Ecto.Migration

  def change do
    create table(:pedidos) do
      add :status, :string
      add :total, :decimal
      add :user_id, :integer
      add :email, :string
      add :telefone, :string
      add :endereco, :string

      timestamps()
    end

  end
end
