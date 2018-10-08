defmodule Jf.Repo.Migrations.CreateEnderecos do
  use Ecto.Migration

  def change do
    create table(:enderecos) do
      add :uf, :string
      add :cidade, :string
      add :endereco, :string
      add :numero, :integer
      add :complemento, :string
      add :pontoreferencia, :string
      add :local, :string

      timestamps()
    end

  end
end
