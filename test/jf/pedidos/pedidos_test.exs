defmodule Jf.PedidosTest do
  use Jf.DataCase

  alias Jf.Pedidos

  describe "pedidos" do
    alias Jf.Pedidos.Pedido

    @valid_attrs %{nome_produto: "some nome_produto", preco_unitario: "120.5", quantidade: 42, status: "some status", total: 42}
    @update_attrs %{nome_produto: "some updated nome_produto", preco_unitario: "456.7", quantidade: 43, status: "some updated status", total: 43}
    @invalid_attrs %{nome_produto: nil, preco_unitario: nil, quantidade: nil, status: nil, total: nil}

    def pedido_fixture(attrs \\ %{}) do
      {:ok, pedido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pedidos.create_pedido()

      pedido
    end

    test "list_pedidos/0 returns all pedidos" do
      pedido = pedido_fixture()
      assert Pedidos.list_pedidos() == [pedido]
    end

    test "get_pedido!/1 returns the pedido with given id" do
      pedido = pedido_fixture()
      assert Pedidos.get_pedido!(pedido.id) == pedido
    end

    test "create_pedido/1 with valid data creates a pedido" do
      assert {:ok, %Pedido{} = pedido} = Pedidos.create_pedido(@valid_attrs)
      assert pedido.nome_produto == "some nome_produto"
      assert pedido.preco_unitario == Decimal.new("120.5")
      assert pedido.quantidade == 42
      assert pedido.status == "some status"
      assert pedido.total == 42
    end

    test "create_pedido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pedidos.create_pedido(@invalid_attrs)
    end

    test "update_pedido/2 with valid data updates the pedido" do
      pedido = pedido_fixture()
      assert {:ok, pedido} = Pedidos.update_pedido(pedido, @update_attrs)
      assert %Pedido{} = pedido
      assert pedido.nome_produto == "some updated nome_produto"
      assert pedido.preco_unitario == Decimal.new("456.7")
      assert pedido.quantidade == 43
      assert pedido.status == "some updated status"
      assert pedido.total == 43
    end

    test "update_pedido/2 with invalid data returns error changeset" do
      pedido = pedido_fixture()
      assert {:error, %Ecto.Changeset{}} = Pedidos.update_pedido(pedido, @invalid_attrs)
      assert pedido == Pedidos.get_pedido!(pedido.id)
    end

    test "delete_pedido/1 deletes the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{}} = Pedidos.delete_pedido(pedido)
      assert_raise Ecto.NoResultsError, fn -> Pedidos.get_pedido!(pedido.id) end
    end

    test "change_pedido/1 returns a pedido changeset" do
      pedido = pedido_fixture()
      assert %Ecto.Changeset{} = Pedidos.change_pedido(pedido)
    end
  end
end
