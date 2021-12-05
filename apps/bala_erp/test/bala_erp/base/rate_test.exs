defmodule BalaErp.Base.RateTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Rate
  @currency_fixture BalaErp.Base.CurrencyFixtures

  describe "rates" do
    alias BalaErp.Base.Schema.Rate

    import BalaErp.Base.RateFixtures

    @invalid_attrs %{
      date: nil,
      value: nil
    }

    test "list_rates/0 returns all rates" do
      rate = rate_fixture()
      assert @context.list_rates() == [rate]
    end

    test "get_rate!/1 returns the rate with given id" do
      rate = rate_fixture()
      assert @context.get_rate!(rate.id) == rate
    end

    test "create_rate/1 with valid data creates a rate" do
      currency = @currency_fixture.currency_fixture()

      valid_attrs = %{
        date: ~N[2021-12-04 12:00:00],
        value: 111.11,
        currency_id: currency.id
      }

      assert {:ok, %Rate{} = rate} = @context.create_rate(valid_attrs)
      assert rate.date == ~N[2021-12-04 12:00:00]
      assert rate.value == 111.11
      assert rate.currency_id == currency.id
    end

    test "create_rate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_rate(@invalid_attrs)
    end

    test "update_rate/2 with valid data updates the rate" do
      rate = rate_fixture()

      update_attrs = %{
        value: 222.22
      }

      assert {:ok, %Rate{} = rate} = @context.update_rate(rate, update_attrs)
      assert rate.value == 222.22
    end

    test "update_rate/2 with invalid data returns error changeset" do
      rate = rate_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_rate(rate, @invalid_attrs)
      assert rate == @context.get_rate!(rate.id)
    end

    test "delete_rate/1 deletes the rate" do
      rate = rate_fixture()
      assert {:ok, %Rate{}} = @context.delete_rate(rate)
      assert_raise Ecto.NoResultsError, fn -> @context.get_rate!(rate.id) end
    end

    test "change_rate/1 returns a rate changeset" do
      rate = rate_fixture()
      assert %Ecto.Changeset{} = @context.change_rate(rate)
    end
  end
end
