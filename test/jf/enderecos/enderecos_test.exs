defmodule Jf.EnderecosTest do
  use Jf.DataCase

  alias Jf.Enderecos

  describe "enderecos" do
    alias Jf.Enderecos.Endereco

    @valid_attrs %{cidade: "some cidade", complemento: "some complemento", endereco: "some endereco", local: "some local", numero: 42, pontoreferencia: "some pontoreferencia", uf: "some uf"}
    @update_attrs %{cidade: "some updated cidade", complemento: "some updated complemento", endereco: "some updated endereco", local: "some updated local", numero: 43, pontoreferencia: "some updated pontoreferencia", uf: "some updated uf"}
    @invalid_attrs %{cidade: nil, complemento: nil, endereco: nil, local: nil, numero: nil, pontoreferencia: nil, uf: nil}

    def endereco_fixture(attrs \\ %{}) do
      {:ok, endereco} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Enderecos.create_endereco()

      endereco
    end

    test "list_enderecos/0 returns all enderecos" do
      endereco = endereco_fixture()
      assert Enderecos.list_enderecos() == [endereco]
    end

    test "get_endereco!/1 returns the endereco with given id" do
      endereco = endereco_fixture()
      assert Enderecos.get_endereco!(endereco.id) == endereco
    end

    test "create_endereco/1 with valid data creates a endereco" do
      assert {:ok, %Endereco{} = endereco} = Enderecos.create_endereco(@valid_attrs)
      assert endereco.cidade == "some cidade"
      assert endereco.complemento == "some complemento"
      assert endereco.endereco == "some endereco"
      assert endereco.local == "some local"
      assert endereco.numero == 42
      assert endereco.pontoreferencia == "some pontoreferencia"
      assert endereco.uf == "some uf"
    end

    test "create_endereco/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enderecos.create_endereco(@invalid_attrs)
    end

    test "update_endereco/2 with valid data updates the endereco" do
      endereco = endereco_fixture()
      assert {:ok, endereco} = Enderecos.update_endereco(endereco, @update_attrs)
      assert %Endereco{} = endereco
      assert endereco.cidade == "some updated cidade"
      assert endereco.complemento == "some updated complemento"
      assert endereco.endereco == "some updated endereco"
      assert endereco.local == "some updated local"
      assert endereco.numero == 43
      assert endereco.pontoreferencia == "some updated pontoreferencia"
      assert endereco.uf == "some updated uf"
    end

    test "update_endereco/2 with invalid data returns error changeset" do
      endereco = endereco_fixture()
      assert {:error, %Ecto.Changeset{}} = Enderecos.update_endereco(endereco, @invalid_attrs)
      assert endereco == Enderecos.get_endereco!(endereco.id)
    end

    test "delete_endereco/1 deletes the endereco" do
      endereco = endereco_fixture()
      assert {:ok, %Endereco{}} = Enderecos.delete_endereco(endereco)
      assert_raise Ecto.NoResultsError, fn -> Enderecos.get_endereco!(endereco.id) end
    end

    test "change_endereco/1 returns a endereco changeset" do
      endereco = endereco_fixture()
      assert %Ecto.Changeset{} = Enderecos.change_endereco(endereco)
    end
  end
end
