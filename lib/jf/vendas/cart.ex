defmodule Jf.Vendas.Cart do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cart" do
    field :id_produto, :integer
    field :nome_produto, :string
    field :preco_unitario, :decimal
    field :quantidade, :integer
    field :total, :decimal

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:id_produto, :nome_produto, :quantidade, :preco_unitario, :total])
    |> validate_required([:id_produto, :nome_produto, :quantidade, :preco_unitario, :total])
  end
end
