defmodule Jf.Catalogo.Produto do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "produtos" do
    field :descricao, :string
    field :imagem, Jf.ImageFile.Type
    field :nome, :string
    field :preco, :decimal

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :descricao, :preco])
    |> validate_required([:nome, :descricao, :preco])
    |> cast_attachments(attrs, [:imagem])
  end
end
