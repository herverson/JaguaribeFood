defmodule JfWeb.EnderecoControllerTest do
  use JfWeb.ConnCase

  alias Jf.Enderecos

  @create_attrs %{cidade: "some cidade", complemento: "some complemento", endereco: "some endereco", local: "some local", numero: 42, pontoreferencia: "some pontoreferencia", uf: "some uf"}
  @update_attrs %{cidade: "some updated cidade", complemento: "some updated complemento", endereco: "some updated endereco", local: "some updated local", numero: 43, pontoreferencia: "some updated pontoreferencia", uf: "some updated uf"}
  @invalid_attrs %{cidade: nil, complemento: nil, endereco: nil, local: nil, numero: nil, pontoreferencia: nil, uf: nil}

  def fixture(:endereco) do
    {:ok, endereco} = Enderecos.create_endereco(@create_attrs)
    endereco
  end

  describe "index" do
    test "lists all enderecos", %{conn: conn} do
      conn = get conn, endereco_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Enderecos"
    end
  end

  describe "new endereco" do
    test "renders form", %{conn: conn} do
      conn = get conn, endereco_path(conn, :new)
      assert html_response(conn, 200) =~ "New Endereco"
    end
  end

  describe "create endereco" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, endereco_path(conn, :create), endereco: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == endereco_path(conn, :show, id)

      conn = get conn, endereco_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Endereco"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, endereco_path(conn, :create), endereco: @invalid_attrs
      assert html_response(conn, 200) =~ "New Endereco"
    end
  end

  describe "edit endereco" do
    setup [:create_endereco]

    test "renders form for editing chosen endereco", %{conn: conn, endereco: endereco} do
      conn = get conn, endereco_path(conn, :edit, endereco)
      assert html_response(conn, 200) =~ "Edit Endereco"
    end
  end

  describe "update endereco" do
    setup [:create_endereco]

    test "redirects when data is valid", %{conn: conn, endereco: endereco} do
      conn = put conn, endereco_path(conn, :update, endereco), endereco: @update_attrs
      assert redirected_to(conn) == endereco_path(conn, :show, endereco)

      conn = get conn, endereco_path(conn, :show, endereco)
      assert html_response(conn, 200) =~ "some updated cidade"
    end

    test "renders errors when data is invalid", %{conn: conn, endereco: endereco} do
      conn = put conn, endereco_path(conn, :update, endereco), endereco: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Endereco"
    end
  end

  describe "delete endereco" do
    setup [:create_endereco]

    test "deletes chosen endereco", %{conn: conn, endereco: endereco} do
      conn = delete conn, endereco_path(conn, :delete, endereco)
      assert redirected_to(conn) == endereco_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, endereco_path(conn, :show, endereco)
      end
    end
  end

  defp create_endereco(_) do
    endereco = fixture(:endereco)
    {:ok, endereco: endereco}
  end
end
