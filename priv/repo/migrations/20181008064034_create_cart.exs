defmodule Jf.Repo.Migrations.CreateCart do
  use Ecto.Migration

  def change do
    create table(:cart) do
      add :id_produto, :integer
      add :nome_produto, :string
      add :quantidade, :integer
      add :preco_unitario, :decimal
      add :total, :decimal

      timestamps()
    end

  end
end
