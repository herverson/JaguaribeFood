defmodule JfWeb.CardapioControllerTest do
  use JfWeb.ConnCase

  alias Jf.Cardapios

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:cardapio) do
    {:ok, cardapio} = Cardapios.create_cardapio(@create_attrs)
    cardapio
  end

  describe "index" do
    test "lists all cardapios", %{conn: conn} do
      conn = get conn, cardapio_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Cardapios"
    end
  end

  describe "new cardapio" do
    test "renders form", %{conn: conn} do
      conn = get conn, cardapio_path(conn, :new)
      assert html_response(conn, 200) =~ "New Cardapio"
    end
  end

  describe "create cardapio" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, cardapio_path(conn, :create), cardapio: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == cardapio_path(conn, :show, id)

      conn = get conn, cardapio_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Cardapio"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cardapio_path(conn, :create), cardapio: @invalid_attrs
      assert html_response(conn, 200) =~ "New Cardapio"
    end
  end

  describe "edit cardapio" do
    setup [:create_cardapio]

    test "renders form for editing chosen cardapio", %{conn: conn, cardapio: cardapio} do
      conn = get conn, cardapio_path(conn, :edit, cardapio)
      assert html_response(conn, 200) =~ "Edit Cardapio"
    end
  end

  describe "update cardapio" do
    setup [:create_cardapio]

    test "redirects when data is valid", %{conn: conn, cardapio: cardapio} do
      conn = put conn, cardapio_path(conn, :update, cardapio), cardapio: @update_attrs
      assert redirected_to(conn) == cardapio_path(conn, :show, cardapio)

      conn = get conn, cardapio_path(conn, :show, cardapio)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cardapio: cardapio} do
      conn = put conn, cardapio_path(conn, :update, cardapio), cardapio: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Cardapio"
    end
  end

  describe "delete cardapio" do
    setup [:create_cardapio]

    test "deletes chosen cardapio", %{conn: conn, cardapio: cardapio} do
      conn = delete conn, cardapio_path(conn, :delete, cardapio)
      assert redirected_to(conn) == cardapio_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, cardapio_path(conn, :show, cardapio)
      end
    end
  end

  defp create_cardapio(_) do
    cardapio = fixture(:cardapio)
    {:ok, cardapio: cardapio}
  end
end
