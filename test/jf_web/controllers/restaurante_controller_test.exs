defmodule JfWeb.RestauranteControllerTest do
  use JfWeb.ConnCase

  alias Jf.Restaurantes

  @create_attrs %{descricao: "some descricao", endereco: "some endereco", logo_marca: "some logo_marca", nome: "some nome"}
  @update_attrs %{descricao: "some updated descricao", endereco: "some updated endereco", logo_marca: "some updated logo_marca", nome: "some updated nome"}
  @invalid_attrs %{descricao: nil, endereco: nil, logo_marca: nil, nome: nil}

  def fixture(:restaurante) do
    {:ok, restaurante} = Restaurantes.create_restaurante(@create_attrs)
    restaurante
  end

  describe "index" do
    test "lists all restaurantes", %{conn: conn} do
      conn = get conn, restaurante_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Restaurantes"
    end
  end

  describe "new restaurante" do
    test "renders form", %{conn: conn} do
      conn = get conn, restaurante_path(conn, :new)
      assert html_response(conn, 200) =~ "New Restaurante"
    end
  end

  describe "create restaurante" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, restaurante_path(conn, :create), restaurante: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == restaurante_path(conn, :show, id)

      conn = get conn, restaurante_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Restaurante"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, restaurante_path(conn, :create), restaurante: @invalid_attrs
      assert html_response(conn, 200) =~ "New Restaurante"
    end
  end

  describe "edit restaurante" do
    setup [:create_restaurante]

    test "renders form for editing chosen restaurante", %{conn: conn, restaurante: restaurante} do
      conn = get conn, restaurante_path(conn, :edit, restaurante)
      assert html_response(conn, 200) =~ "Edit Restaurante"
    end
  end

  describe "update restaurante" do
    setup [:create_restaurante]

    test "redirects when data is valid", %{conn: conn, restaurante: restaurante} do
      conn = put conn, restaurante_path(conn, :update, restaurante), restaurante: @update_attrs
      assert redirected_to(conn) == restaurante_path(conn, :show, restaurante)

      conn = get conn, restaurante_path(conn, :show, restaurante)
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, restaurante: restaurante} do
      conn = put conn, restaurante_path(conn, :update, restaurante), restaurante: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Restaurante"
    end
  end

  describe "delete restaurante" do
    setup [:create_restaurante]

    test "deletes chosen restaurante", %{conn: conn, restaurante: restaurante} do
      conn = delete conn, restaurante_path(conn, :delete, restaurante)
      assert redirected_to(conn) == restaurante_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, restaurante_path(conn, :show, restaurante)
      end
    end
  end

  defp create_restaurante(_) do
    restaurante = fixture(:restaurante)
    {:ok, restaurante: restaurante}
  end
end
