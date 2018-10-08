defmodule Jf.CatalogoTest do
  use Jf.DataCase

  alias Jf.Catalogo

  describe "produtos" do
    alias Jf.Catalogo.Produto

    @valid_attrs %{descricao: "some descricao", imagem: "some imagem", nome: "some nome", preco: "120.5"}
    @update_attrs %{descricao: "some updated descricao", imagem: "some updated imagem", nome: "some updated nome", preco: "456.7"}
    @invalid_attrs %{descricao: nil, imagem: nil, nome: nil, preco: nil}

    def produto_fixture(attrs \\ %{}) do
      {:ok, produto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalogo.create_produto()

      produto
    end

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Catalogo.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Catalogo.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      assert {:ok, %Produto{} = produto} = Catalogo.create_produto(@valid_attrs)
      assert produto.descricao == "some descricao"
      assert produto.imagem == "some imagem"
      assert produto.nome == "some nome"
      assert produto.preco == Decimal.new("120.5")
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogo.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      assert {:ok, produto} = Catalogo.update_produto(produto, @update_attrs)
      assert %Produto{} = produto
      assert produto.descricao == "some updated descricao"
      assert produto.imagem == "some updated imagem"
      assert produto.nome == "some updated nome"
      assert produto.preco == Decimal.new("456.7")
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogo.update_produto(produto, @invalid_attrs)
      assert produto == Catalogo.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Catalogo.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Catalogo.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Catalogo.change_produto(produto)
    end
  end
end
