defmodule Jf.Restaurantes do
  @moduledoc """
  The Restaurantes context.
  """

  import Ecto.Query, warn: false
  alias Jf.Repo

  alias Jf.Restaurantes.Restaurante

  @doc """
  Returns the list of restaurantes.

  ## Examples

      iex> list_restaurantes()
      [%Restaurante{}, ...]

  """
  def list_restaurantes do
    Repo.all(Restaurante)
  end

  @doc """
  Gets a single restaurante.

  Raises `Ecto.NoResultsError` if the Restaurante does not exist.

  ## Examples

      iex> get_restaurante!(123)
      %Restaurante{}

      iex> get_restaurante!(456)
      ** (Ecto.NoResultsError)

  """
  def get_restaurante!(id), do: Repo.get!(Restaurante, id)

  @doc """
  Creates a restaurante.

  ## Examples

      iex> create_restaurante(%{field: value})
      {:ok, %Restaurante{}}

      iex> create_restaurante(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_restaurante(attrs \\ %{}) do
    %Restaurante{}
    |> Restaurante.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a restaurante.

  ## Examples

      iex> update_restaurante(restaurante, %{field: new_value})
      {:ok, %Restaurante{}}

      iex> update_restaurante(restaurante, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_restaurante(%Restaurante{} = restaurante, attrs) do
    restaurante
    |> Restaurante.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Restaurante.

  ## Examples

      iex> delete_restaurante(restaurante)
      {:ok, %Restaurante{}}

      iex> delete_restaurante(restaurante)
      {:error, %Ecto.Changeset{}}

  """
  def delete_restaurante(%Restaurante{} = restaurante) do
    Repo.delete(restaurante)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking restaurante changes.

  ## Examples

      iex> change_restaurante(restaurante)
      %Ecto.Changeset{source: %Restaurante{}}

  """
  def change_restaurante(%Restaurante{} = restaurante) do
    Restaurante.changeset(restaurante, %{})
  end
end
