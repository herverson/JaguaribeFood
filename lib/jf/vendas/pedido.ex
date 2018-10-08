defmodule Jf.Vendas.Pedido do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pedidos" do   
    field :email, :string
    field :endereco, :string
    field :status, :string
    field :telefone, :string
    field :total, :decimal
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:status, :total, :user_id, :email, :telefone, :endereco])
    |> validate_required([:status, :total, :user_id, :email, :telefone, :endereco])
  end
end
