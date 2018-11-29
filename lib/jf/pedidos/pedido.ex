defmodule Jf.Pedidos.Pedido do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pedidos" do
    field :nome_produto, :string
    field :preco_unitario, :decimal
    field :quantidade, :integer
    field :status, :string
    field :total, :decimal

    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:nome_produto, :quantidade, :preco_unitario, :total, :status])
    |> validate_required([:nome_produto, :quantidade, :preco_unitario, :total, :status])
  end
end
