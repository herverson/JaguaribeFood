defmodule Jf.Cardapios do
  @moduledoc """
  The Cardapios context.
  """

  import Ecto.Query, warn: false
  alias Jf.Repo

  alias Jf.Cardapios.Cardapio

  @doc """
  Returns the list of cardapios.

  ## Examples

      iex> list_cardapios()
      [%Cardapio{}, ...]

  """
  def list_cardapios do
    Repo.all(Cardapio)
  end

  @doc """
  Gets a single cardapio.

  Raises `Ecto.NoResultsError` if the Cardapio does not exist.

  ## Examples

      iex> get_cardapio!(123)
      %Cardapio{}

      iex> get_cardapio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cardapio!(id), do: Repo.get!(Cardapio, id)

  @doc """
  Creates a cardapio.

  ## Examples

      iex> create_cardapio(%{field: value})
      {:ok, %Cardapio{}}

      iex> create_cardapio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cardapio(attrs \\ %{}) do
    %Cardapio{}
    |> Cardapio.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cardapio.

  ## Examples

      iex> update_cardapio(cardapio, %{field: new_value})
      {:ok, %Cardapio{}}

      iex> update_cardapio(cardapio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cardapio(%Cardapio{} = cardapio, attrs) do
    cardapio
    |> Cardapio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cardapio.

  ## Examples

      iex> delete_cardapio(cardapio)
      {:ok, %Cardapio{}}

      iex> delete_cardapio(cardapio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cardapio(%Cardapio{} = cardapio) do
    Repo.delete(cardapio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cardapio changes.

  ## Examples

      iex> change_cardapio(cardapio)
      %Ecto.Changeset{source: %Cardapio{}}

  """
  def change_cardapio(%Cardapio{} = cardapio) do
    Cardapio.changeset(cardapio, %{})
  end
end
