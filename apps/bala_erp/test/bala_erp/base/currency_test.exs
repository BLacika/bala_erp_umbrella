defmodule BalaErp.Base.CurrencyTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Currency

  describe "currencies" do
    alias BalaErp.Base.Schema.Currency

    import BalaErp.Base.CurrencyFixtures

    @invalid_attrs %{
      active: nil,
      decimal_places: nil,
      label: nil,
      name: nil,
      symbol: nil,
      symbol_position: nil
    }

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert @context.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert @context.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      valid_attrs = %{
        active: true,
        decimal_places: 42,
        label: "some label",
        name: "some name",
        symbol: "some symbol",
        symbol_position: "after"
      }

      assert {:ok, %Currency{} = currency} = @context.create_currency(valid_attrs)
      assert currency.active == true
      assert currency.decimal_places == 42
      assert currency.label == "some label"
      assert currency.name == "some name"
      assert currency.symbol == "some symbol"
      assert currency.symbol_position == "after"
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()

      update_attrs = %{
        active: false,
        decimal_places: 43,
        label: "some updated label",
        name: "some updated name",
        symbol: "some updated symbol",
        symbol_position: "before"
      }

      assert {:ok, %Currency{} = currency} = @context.update_currency(currency, update_attrs)
      assert currency.active == false
      assert currency.decimal_places == 43
      assert currency.label == "some updated label"
      assert currency.name == "some updated name"
      assert currency.symbol == "some updated symbol"
      assert currency.symbol_position == "before"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_currency(currency, @invalid_attrs)
      assert currency == @context.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = @context.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> @context.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = @context.change_currency(currency)
    end
  end
end
