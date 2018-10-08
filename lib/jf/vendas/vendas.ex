defmodule Jf.Vendas do
  @moduledoc """
  The Vendas context.
  """

  import Ecto.Query, warn: false
  alias Jf.Repo

  alias Jf.Vendas.Pedido

  @doc """
  Returns the list of pedidos.

  ## Examples

      iex> list_pedidos()
      [%Pedido{}, ...]

  """
  def list_pedidos do
    Repo.all(Pedido)
  end

  @doc """
  Gets a single pedido.

  Raises `Ecto.NoResultsError` if the Pedido does not exist.

  ## Examples

      iex> get_pedido!(123)
      %Pedido{}

      iex> get_pedido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pedido!(id), do: Repo.get!(Pedido, id)

  @doc """
  Creates a pedido.

  ## Examples

      iex> create_pedido(%{field: value})
      {:ok, %Pedido{}}

      iex> create_pedido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pedido(attrs \\ %{}) do
    %Pedido{}
    |> Pedido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pedido.

  ## Examples

      iex> update_pedido(pedido, %{field: new_value})
      {:ok, %Pedido{}}

      iex> update_pedido(pedido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pedido(%Pedido{} = pedido, attrs) do
    pedido
    |> Pedido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pedido.

  ## Examples

      iex> delete_pedido(pedido)
      {:ok, %Pedido{}}

      iex> delete_pedido(pedido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pedido(%Pedido{} = pedido) do
    Repo.delete(pedido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pedido changes.

  ## Examples

      iex> change_pedido(pedido)
      %Ecto.Changeset{source: %Pedido{}}

  """
  def change_pedido(%Pedido{} = pedido) do
    Pedido.changeset(pedido, %{})
  end
end
