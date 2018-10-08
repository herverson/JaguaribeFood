defmodule Jf.Enderecos do
  @moduledoc """
  The Enderecos context.
  """

  import Ecto.Query, warn: false
  alias Jf.Repo

  alias Jf.Enderecos.Endereco

  @doc """
  Returns the list of enderecos.

  ## Examples

      iex> list_enderecos()
      [%Endereco{}, ...]

  """
  def list_enderecos do
    Repo.all(Endereco)
  end

  @doc """
  Gets a single endereco.

  Raises `Ecto.NoResultsError` if the Endereco does not exist.

  ## Examples

      iex> get_endereco!(123)
      %Endereco{}

      iex> get_endereco!(456)
      ** (Ecto.NoResultsError)

  """
  def get_endereco!(id), do: Repo.get!(Endereco, id)

  @doc """
  Creates a endereco.

  ## Examples

      iex> create_endereco(%{field: value})
      {:ok, %Endereco{}}

      iex> create_endereco(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_endereco(attrs \\ %{}) do
    %Endereco{}
    |> Endereco.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a endereco.

  ## Examples

      iex> update_endereco(endereco, %{field: new_value})
      {:ok, %Endereco{}}

      iex> update_endereco(endereco, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_endereco(%Endereco{} = endereco, attrs) do
    endereco
    |> Endereco.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Endereco.

  ## Examples

      iex> delete_endereco(endereco)
      {:ok, %Endereco{}}

      iex> delete_endereco(endereco)
      {:error, %Ecto.Changeset{}}

  """
  def delete_endereco(%Endereco{} = endereco) do
    Repo.delete(endereco)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking endereco changes.

  ## Examples

      iex> change_endereco(endereco)
      %Ecto.Changeset{source: %Endereco{}}

  """
  def change_endereco(%Endereco{} = endereco) do
    Endereco.changeset(endereco, %{})
  end
end
