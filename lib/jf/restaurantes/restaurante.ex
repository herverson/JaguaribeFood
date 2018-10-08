defmodule Jf.Restaurantes.Restaurante do
  use Ecto.Schema
  import Ecto.Changeset


  schema "restaurantes" do
    field :descricao, :string
    field :endereco, :string
    field :logo_marca, :string #Jf.ImageUploader.Type
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(restaurante, attrs) do
    restaurante
    |> cast(attrs, [:nome, :descricao, :endereco, :logo_marca])
    |> validate_required([:nome, :descricao, :endereco, :logo_marca])
  end
end
