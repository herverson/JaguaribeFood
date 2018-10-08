defmodule Jf.Repo.Migrations.CreateRestaurantes do
  use Ecto.Migration

  def change do
    create table(:restaurantes) do
      add :nome, :string
      add :descricao, :string
      add :endereco, :string
      add :logo_marca, :string

      timestamps()
    end

  end
end
