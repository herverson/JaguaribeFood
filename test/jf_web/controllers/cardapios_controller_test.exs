defmodule JfWeb.CardapiosControllerTest do
  use JfWeb.ConnCase

  alias Jf.Catalago

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:cardapios) do
    {:ok, cardapios} = Catalago.create_cardapios(@create_attrs)
    cardapios
  end

  describe "index" do
    test "lists all cardapios", %{conn: conn} do
      conn = get conn, cardapios_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Cardapios"
    end
  end

  describe "new cardapios" do
    test "renders form", %{conn: conn} do
      conn = get conn, cardapios_path(conn, :new)
      assert html_response(conn, 200) =~ "New Cardapios"
    end
  end

  describe "create cardapios" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, cardapios_path(conn, :create), cardapios: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == cardapios_path(conn, :show, id)

      conn = get conn, cardapios_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Cardapios"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cardapios_path(conn, :create), cardapios: @invalid_attrs
      assert html_response(conn, 200) =~ "New Cardapios"
    end
  end

  describe "edit cardapios" do
    setup [:create_cardapios]

    test "renders form for editing chosen cardapios", %{conn: conn, cardapios: cardapios} do
      conn = get conn, cardapios_path(conn, :edit, cardapios)
      assert html_response(conn, 200) =~ "Edit Cardapios"
    end
  end

  describe "update cardapios" do
    setup [:create_cardapios]

    test "redirects when data is valid", %{conn: conn, cardapios: cardapios} do
      conn = put conn, cardapios_path(conn, :update, cardapios), cardapios: @update_attrs
      assert redirected_to(conn) == cardapios_path(conn, :show, cardapios)

      conn = get conn, cardapios_path(conn, :show, cardapios)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cardapios: cardapios} do
      conn = put conn, cardapios_path(conn, :update, cardapios), cardapios: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Cardapios"
    end
  end

  describe "delete cardapios" do
    setup [:create_cardapios]

    test "deletes chosen cardapios", %{conn: conn, cardapios: cardapios} do
      conn = delete conn, cardapios_path(conn, :delete, cardapios)
      assert redirected_to(conn) == cardapios_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, cardapios_path(conn, :show, cardapios)
      end
    end
  end

  defp create_cardapios(_) do
    cardapios = fixture(:cardapios)
    {:ok, cardapios: cardapios}
  end
end
