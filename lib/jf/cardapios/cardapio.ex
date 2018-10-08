defmodule Jf.Cardapios.Cardapio do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cardapios" do
    field :id_produto, :id
    field :id_restaurante, :id

    timestamps()
  end

  @doc false
  def changeset(cardapio, attrs) do
    cardapio
    |> cast(attrs, [])
    |> validate_required([])
  end
end
