defmodule Jf.CatalagoTest do
  use Jf.DataCase

  alias Jf.Catalago

  describe "cardapios" do
    alias Jf.Catalago.Cardapios

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def cardapios_fixture(attrs \\ %{}) do
      {:ok, cardapios} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalago.create_cardapios()

      cardapios
    end

    test "list_cardapios/0 returns all cardapios" do
      cardapios = cardapios_fixture()
      assert Catalago.list_cardapios() == [cardapios]
    end

    test "get_cardapios!/1 returns the cardapios with given id" do
      cardapios = cardapios_fixture()
      assert Catalago.get_cardapios!(cardapios.id) == cardapios
    end

    test "create_cardapios/1 with valid data creates a cardapios" do
      assert {:ok, %Cardapios{} = cardapios} = Catalago.create_cardapios(@valid_attrs)
    end

    test "create_cardapios/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalago.create_cardapios(@invalid_attrs)
    end

    test "update_cardapios/2 with valid data updates the cardapios" do
      cardapios = cardapios_fixture()
      assert {:ok, cardapios} = Catalago.update_cardapios(cardapios, @update_attrs)
      assert %Cardapios{} = cardapios
    end

    test "update_cardapios/2 with invalid data returns error changeset" do
      cardapios = cardapios_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalago.update_cardapios(cardapios, @invalid_attrs)
      assert cardapios == Catalago.get_cardapios!(cardapios.id)
    end

    test "delete_cardapios/1 deletes the cardapios" do
      cardapios = cardapios_fixture()
      assert {:ok, %Cardapios{}} = Catalago.delete_cardapios(cardapios)
      assert_raise Ecto.NoResultsError, fn -> Catalago.get_cardapios!(cardapios.id) end
    end

    test "change_cardapios/1 returns a cardapios changeset" do
      cardapios = cardapios_fixture()
      assert %Ecto.Changeset{} = Catalago.change_cardapios(cardapios)
    end
  end
end
