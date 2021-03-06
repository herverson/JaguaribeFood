defmodule Jf.VendasTest do
  use Jf.DataCase

  alias Jf.Vendas

  describe "pedidos" do
    alias Jf.Vendas.Pedido

    @valid_attrs %{email: "some email", endereco: "some endereco", status: "some status", telefone: "some telefone", total: "120.5", user_id: 42}
    @update_attrs %{email: "some updated email", endereco: "some updated endereco", status: "some updated status", telefone: "some updated telefone", total: "456.7", user_id: 43}
    @invalid_attrs %{email: nil, endereco: nil, status: nil, telefone: nil, total: nil, user_id: nil}

    def pedido_fixture(attrs \\ %{}) do
      {:ok, pedido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vendas.create_pedido()

      pedido
    end

    test "list_pedidos/0 returns all pedidos" do
      pedido = pedido_fixture()
      assert Vendas.list_pedidos() == [pedido]
    end

    test "get_pedido!/1 returns the pedido with given id" do
      pedido = pedido_fixture()
      assert Vendas.get_pedido!(pedido.id) == pedido
    end

    test "create_pedido/1 with valid data creates a pedido" do
      assert {:ok, %Pedido{} = pedido} = Vendas.create_pedido(@valid_attrs)
      assert pedido.email == "some email"
      assert pedido.endereco == "some endereco"
      assert pedido.status == "some status"
      assert pedido.telefone == "some telefone"
      assert pedido.total == Decimal.new("120.5")
      assert pedido.user_id == 42
    end

    test "create_pedido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vendas.create_pedido(@invalid_attrs)
    end

    test "update_pedido/2 with valid data updates the pedido" do
      pedido = pedido_fixture()
      assert {:ok, pedido} = Vendas.update_pedido(pedido, @update_attrs)
      assert %Pedido{} = pedido
      assert pedido.email == "some updated email"
      assert pedido.endereco == "some updated endereco"
      assert pedido.status == "some updated status"
      assert pedido.telefone == "some updated telefone"
      assert pedido.total == Decimal.new("456.7")
      assert pedido.user_id == 43
    end

    test "update_pedido/2 with invalid data returns error changeset" do
      pedido = pedido_fixture()
      assert {:error, %Ecto.Changeset{}} = Vendas.update_pedido(pedido, @invalid_attrs)
      assert pedido == Vendas.get_pedido!(pedido.id)
    end

    test "delete_pedido/1 deletes the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{}} = Vendas.delete_pedido(pedido)
      assert_raise Ecto.NoResultsError, fn -> Vendas.get_pedido!(pedido.id) end
    end

    test "change_pedido/1 returns a pedido changeset" do
      pedido = pedido_fixture()
      assert %Ecto.Changeset{} = Vendas.change_pedido(pedido)
    end
  end

  describe "cart" do
    alias Jf.Vendas.Cart

    @valid_attrs %{id_produto: 42, nome_produto: "some nome_produto", preco_unitario: "120.5", quantidade: 42, total: "120.5"}
    @update_attrs %{id_produto: 43, nome_produto: "some updated nome_produto", preco_unitario: "456.7", quantidade: 43, total: "456.7"}
    @invalid_attrs %{id_produto: nil, nome_produto: nil, preco_unitario: nil, quantidade: nil, total: nil}

    def cart_fixture(attrs \\ %{}) do
      {:ok, cart} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vendas.create_cart()

      cart
    end

    test "list_cart/0 returns all cart" do
      cart = cart_fixture()
      assert Vendas.list_cart() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Vendas.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      assert {:ok, %Cart{} = cart} = Vendas.create_cart(@valid_attrs)
      assert cart.id_produto == 42
      assert cart.nome_produto == "some nome_produto"
      assert cart.preco_unitario == Decimal.new("120.5")
      assert cart.quantidade == 42
      assert cart.total == Decimal.new("120.5")
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vendas.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      assert {:ok, cart} = Vendas.update_cart(cart, @update_attrs)
      assert %Cart{} = cart
      assert cart.id_produto == 43
      assert cart.nome_produto == "some updated nome_produto"
      assert cart.preco_unitario == Decimal.new("456.7")
      assert cart.quantidade == 43
      assert cart.total == Decimal.new("456.7")
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Vendas.update_cart(cart, @invalid_attrs)
      assert cart == Vendas.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Vendas.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Vendas.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Vendas.change_cart(cart)
    end
  end
end
