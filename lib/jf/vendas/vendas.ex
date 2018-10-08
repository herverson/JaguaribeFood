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

  alias Jf.Vendas.Cart

  @doc """
  Returns the list of cart.

  ## Examples

      iex> list_cart()
      [%Cart{}, ...]

  """
  def list_cart do
    Repo.all(Cart)
  end

  @doc """
  Gets a single cart.

  Raises `Ecto.NoResultsError` if the Cart does not exist.

  ## Examples

      iex> get_cart!(123)
      %Cart{}

      iex> get_cart!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cart!(id), do: Repo.get!(Cart, id)

  @doc """
  Creates a cart.

  ## Examples

      iex> create_cart(%{field: value})
      {:ok, %Cart{}}

      iex> create_cart(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cart(attrs \\ %{}) do
    %Cart{}
    |> Cart.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cart.

  ## Examples

      iex> update_cart(cart, %{field: new_value})
      {:ok, %Cart{}}

      iex> update_cart(cart, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cart(%Cart{} = cart, attrs) do
    cart
    |> Cart.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cart.

  ## Examples

      iex> delete_cart(cart)
      {:ok, %Cart{}}

      iex> delete_cart(cart)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cart(%Cart{} = cart) do
    Repo.delete(cart)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cart changes.

  ## Examples

      iex> change_cart(cart)
      %Ecto.Changeset{source: %Cart{}}

  """
  def change_cart(%Cart{} = cart) do
    Cart.changeset(cart, %{})
  end
end
