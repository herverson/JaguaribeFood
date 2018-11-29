defmodule JfWeb.PedidoControllerTest do
  use JfWeb.ConnCase

  alias Jf.Pedidos

  @create_attrs %{nome_produto: "some nome_produto", preco_unitario: "120.5", quantidade: 42, status: "some status", total: 42}
  @update_attrs %{nome_produto: "some updated nome_produto", preco_unitario: "456.7", quantidade: 43, status: "some updated status", total: 43}
  @invalid_attrs %{nome_produto: nil, preco_unitario: nil, quantidade: nil, status: nil, total: nil}

  def fixture(:pedido) do
    {:ok, pedido} = Pedidos.create_pedido(@create_attrs)
    pedido
  end

  describe "index" do
    test "lists all pedidos", %{conn: conn} do
      conn = get conn, pedido_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Pedidos"
    end
  end

  describe "new pedido" do
    test "renders form", %{conn: conn} do
      conn = get conn, pedido_path(conn, :new)
      assert html_response(conn, 200) =~ "New Pedido"
    end
  end

  describe "create pedido" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, pedido_path(conn, :create), pedido: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == pedido_path(conn, :show, id)

      conn = get conn, pedido_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Pedido"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pedido_path(conn, :create), pedido: @invalid_attrs
      assert html_response(conn, 200) =~ "New Pedido"
    end
  end

  describe "edit pedido" do
    setup [:create_pedido]

    test "renders form for editing chosen pedido", %{conn: conn, pedido: pedido} do
      conn = get conn, pedido_path(conn, :edit, pedido)
      assert html_response(conn, 200) =~ "Edit Pedido"
    end
  end

  describe "update pedido" do
    setup [:create_pedido]

    test "redirects when data is valid", %{conn: conn, pedido: pedido} do
      conn = put conn, pedido_path(conn, :update, pedido), pedido: @update_attrs
      assert redirected_to(conn) == pedido_path(conn, :show, pedido)

      conn = get conn, pedido_path(conn, :show, pedido)
      assert html_response(conn, 200) =~ "some updated nome_produto"
    end

    test "renders errors when data is invalid", %{conn: conn, pedido: pedido} do
      conn = put conn, pedido_path(conn, :update, pedido), pedido: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Pedido"
    end
  end

  describe "delete pedido" do
    setup [:create_pedido]

    test "deletes chosen pedido", %{conn: conn, pedido: pedido} do
      conn = delete conn, pedido_path(conn, :delete, pedido)
      assert redirected_to(conn) == pedido_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, pedido_path(conn, :show, pedido)
      end
    end
  end

  defp create_pedido(_) do
    pedido = fixture(:pedido)
    {:ok, pedido: pedido}
  end
end
