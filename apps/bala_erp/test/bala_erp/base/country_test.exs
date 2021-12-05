defmodule BalaErp.Base.CountryTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Country
  @currency_fixture BalaErp.Base.CurrencyFixtures

  describe "countries" do
    alias BalaErp.Base.Schema.Country

    import BalaErp.Base.CountryFixtures

    @invalid_attrs %{
      name: nil,
      code: nil,
      currency_id: nil
    }

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert @context.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert @context.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      currency = @currency_fixture.currency_fixture()

      valid_attrs = %{
        name: "some name",
        code: "some code",
        currency_id: currency.id
      }

      assert {:ok, %Country{} = country} = @context.create_country(valid_attrs)
      assert country.name == "some name"
      assert country.code == "some code"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()

      update_attrs = %{
        name: "some updated name",
        code: "some updated code"
      }

      assert {:ok, %Country{} = country} = @context.update_country(country, update_attrs)
      assert country.name == "some updated name"
      assert country.code == "some updated code"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_country(country, @invalid_attrs)
      assert country == @context.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = @context.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> @context.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = @context.change_country(country)
    end
  end
end
