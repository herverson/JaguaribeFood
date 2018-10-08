defmodule Jf.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string
      add :descricao, :string
      add :preco, :decimal
      add :imagem, :string

      timestamps()
    end

  end
end
