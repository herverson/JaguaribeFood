defmodule Jf.Restaurantes.Restaurante do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "restaurantes" do
    field :descricao, :string
    field :endereco, :string
    field :logo_marca, Jf.ImageFile.Type
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(restaurante, attrs) do
    restaurante
    |> cast(attrs, [:nome, :descricao, :endereco])
    |> validate_required([:nome, :descricao, :endereco])
    |> cast_attachments(attrs, [:logo_marca])
  end
end
