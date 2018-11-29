defmodule Jf.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Jf.Message

  schema "messages" do
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end

  def get_msgs(limit \\ 20) do
    Jf.Repo.all(Jf.Messages.Message, limit: limit)
  end
end
