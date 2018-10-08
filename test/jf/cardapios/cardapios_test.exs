defmodule Jf.CardapiosTest do
  use Jf.DataCase

  alias Jf.Cardapios

  describe "cardapios" do
    alias Jf.Cardapios.Cardapio

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def cardapio_fixture(attrs \\ %{}) do
      {:ok, cardapio} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cardapios.create_cardapio()

      cardapio
    end

    test "list_cardapios/0 returns all cardapios" do
      cardapio = cardapio_fixture()
      assert Cardapios.list_cardapios() == [cardapio]
    end

    test "get_cardapio!/1 returns the cardapio with given id" do
      cardapio = cardapio_fixture()
      assert Cardapios.get_cardapio!(cardapio.id) == cardapio
    end

    test "create_cardapio/1 with valid data creates a cardapio" do
      assert {:ok, %Cardapio{} = cardapio} = Cardapios.create_cardapio(@valid_attrs)
    end

    test "create_cardapio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cardapios.create_cardapio(@invalid_attrs)
    end

    test "update_cardapio/2 with valid data updates the cardapio" do
      cardapio = cardapio_fixture()
      assert {:ok, cardapio} = Cardapios.update_cardapio(cardapio, @update_attrs)
      assert %Cardapio{} = cardapio
    end

    test "update_cardapio/2 with invalid data returns error changeset" do
      cardapio = cardapio_fixture()
      assert {:error, %Ecto.Changeset{}} = Cardapios.update_cardapio(cardapio, @invalid_attrs)
      assert cardapio == Cardapios.get_cardapio!(cardapio.id)
    end

    test "delete_cardapio/1 deletes the cardapio" do
      cardapio = cardapio_fixture()
      assert {:ok, %Cardapio{}} = Cardapios.delete_cardapio(cardapio)
      assert_raise Ecto.NoResultsError, fn -> Cardapios.get_cardapio!(cardapio.id) end
    end

    test "change_cardapio/1 returns a cardapio changeset" do
      cardapio = cardapio_fixture()
      assert %Ecto.Changeset{} = Cardapios.change_cardapio(cardapio)
    end
  end
end
