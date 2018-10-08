defmodule Jf.RestaurantesTest do
  use Jf.DataCase

  alias Jf.Restaurantes

  describe "restaurantes" do
    alias Jf.Restaurantes.Restaurante

    @valid_attrs %{descricao: "some descricao", imagem: "some imagem", nome: "some nome"}
    @update_attrs %{descricao: "some updated descricao", imagem: "some updated imagem", nome: "some updated nome"}
    @invalid_attrs %{descricao: nil, imagem: nil, nome: nil}

    def restaurante_fixture(attrs \\ %{}) do
      {:ok, restaurante} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Restaurantes.create_restaurante()

      restaurante
    end

    test "list_restaurantes/0 returns all restaurantes" do
      restaurante = restaurante_fixture()
      assert Restaurantes.list_restaurantes() == [restaurante]
    end

    test "get_restaurante!/1 returns the restaurante with given id" do
      restaurante = restaurante_fixture()
      assert Restaurantes.get_restaurante!(restaurante.id) == restaurante
    end

    test "create_restaurante/1 with valid data creates a restaurante" do
      assert {:ok, %Restaurante{} = restaurante} = Restaurantes.create_restaurante(@valid_attrs)
      assert restaurante.descricao == "some descricao"
      assert restaurante.imagem == "some imagem"
      assert restaurante.nome == "some nome"
    end

    test "create_restaurante/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurantes.create_restaurante(@invalid_attrs)
    end

    test "update_restaurante/2 with valid data updates the restaurante" do
      restaurante = restaurante_fixture()
      assert {:ok, restaurante} = Restaurantes.update_restaurante(restaurante, @update_attrs)
      assert %Restaurante{} = restaurante
      assert restaurante.descricao == "some updated descricao"
      assert restaurante.imagem == "some updated imagem"
      assert restaurante.nome == "some updated nome"
    end

    test "update_restaurante/2 with invalid data returns error changeset" do
      restaurante = restaurante_fixture()
      assert {:error, %Ecto.Changeset{}} = Restaurantes.update_restaurante(restaurante, @invalid_attrs)
      assert restaurante == Restaurantes.get_restaurante!(restaurante.id)
    end

    test "delete_restaurante/1 deletes the restaurante" do
      restaurante = restaurante_fixture()
      assert {:ok, %Restaurante{}} = Restaurantes.delete_restaurante(restaurante)
      assert_raise Ecto.NoResultsError, fn -> Restaurantes.get_restaurante!(restaurante.id) end
    end

    test "change_restaurante/1 returns a restaurante changeset" do
      restaurante = restaurante_fixture()
      assert %Ecto.Changeset{} = Restaurantes.change_restaurante(restaurante)
    end
  end

  describe "restaurantes" do
    alias Jf.Restaurantes.Restaurante

    @valid_attrs %{descricao: "some descricao", endereco: "some endereco", logo_marca: "some logo_marca", nome: "some nome"}
    @update_attrs %{descricao: "some updated descricao", endereco: "some updated endereco", logo_marca: "some updated logo_marca", nome: "some updated nome"}
    @invalid_attrs %{descricao: nil, endereco: nil, logo_marca: nil, nome: nil}

    def restaurante_fixture(attrs \\ %{}) do
      {:ok, restaurante} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Restaurantes.create_restaurante()

      restaurante
    end

    test "list_restaurantes/0 returns all restaurantes" do
      restaurante = restaurante_fixture()
      assert Restaurantes.list_restaurantes() == [restaurante]
    end

    test "get_restaurante!/1 returns the restaurante with given id" do
      restaurante = restaurante_fixture()
      assert Restaurantes.get_restaurante!(restaurante.id) == restaurante
    end

    test "create_restaurante/1 with valid data creates a restaurante" do
      assert {:ok, %Restaurante{} = restaurante} = Restaurantes.create_restaurante(@valid_attrs)
      assert restaurante.descricao == "some descricao"
      assert restaurante.endereco == "some endereco"
      assert restaurante.logo_marca == "some logo_marca"
      assert restaurante.nome == "some nome"
    end

    test "create_restaurante/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurantes.create_restaurante(@invalid_attrs)
    end

    test "update_restaurante/2 with valid data updates the restaurante" do
      restaurante = restaurante_fixture()
      assert {:ok, restaurante} = Restaurantes.update_restaurante(restaurante, @update_attrs)
      assert %Restaurante{} = restaurante
      assert restaurante.descricao == "some updated descricao"
      assert restaurante.endereco == "some updated endereco"
      assert restaurante.logo_marca == "some updated logo_marca"
      assert restaurante.nome == "some updated nome"
    end

    test "update_restaurante/2 with invalid data returns error changeset" do
      restaurante = restaurante_fixture()
      assert {:error, %Ecto.Changeset{}} = Restaurantes.update_restaurante(restaurante, @invalid_attrs)
      assert restaurante == Restaurantes.get_restaurante!(restaurante.id)
    end

    test "delete_restaurante/1 deletes the restaurante" do
      restaurante = restaurante_fixture()
      assert {:ok, %Restaurante{}} = Restaurantes.delete_restaurante(restaurante)
      assert_raise Ecto.NoResultsError, fn -> Restaurantes.get_restaurante!(restaurante.id) end
    end

    test "change_restaurante/1 returns a restaurante changeset" do
      restaurante = restaurante_fixture()
      assert %Ecto.Changeset{} = Restaurantes.change_restaurante(restaurante)
    end
  end
end
