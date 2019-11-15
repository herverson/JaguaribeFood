defmodule Jf.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :username, :string
      add :senha, :string
      add :nome, :string

      timestamps()
    end

    create unique_index(:admins, [:username])
  end
end
