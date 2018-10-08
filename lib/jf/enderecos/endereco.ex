defmodule Jf.Enderecos.Endereco do
  use Ecto.Schema
  import Ecto.Changeset


  schema "enderecos" do
    field :cidade, :string
    field :complemento, :string
    field :endereco, :string
    field :local, :string
    field :numero, :integer
    field :pontoreferencia, :string
    field :uf, :string

    timestamps()
  end

  @doc false
  def changeset(endereco, attrs) do
    endereco
    |> cast(attrs, [:uf, :cidade, :endereco, :numero, :complemento, :pontoreferencia, :local])
    |> validate_required([:uf, :cidade, :endereco, :numero, :complemento, :pontoreferencia, :local])
  end
end
