defmodule Jf.Repo.Migrations.CreatePedidos do
  use Ecto.Migration

  def change do
    create table(:pedidos) do
      add :nome_produto, :string
      add :quantidade, :integer
      add :preco_unitario, :decimal
      add :total, :decimal
      add :status, :string

      timestamps()
    end

  end
end
