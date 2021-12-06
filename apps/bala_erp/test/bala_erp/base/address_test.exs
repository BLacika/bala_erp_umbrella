defmodule BalaErp.Base.AddressTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Address

  describe "addresses" do
    alias BalaErp.Base.Schema.Address

    import BalaErp.Base.AddressFixtures

    @invalid_attrs %{
      name: nil,
      country_id: nil
    }

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert @context.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert @context.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      country = BalaErp.Base.CountryFixtures.country_fixture()

      valid_attrs = %{
        name: "some name",
        country_id: country.id,
        city: "some city",
        street: "some street",
        zip: "1234"
      }

      assert {:ok, %Address{} = address} = @context.create_address(valid_attrs)
      assert address.name == "some name"
      assert address.country_id == country.id
      assert address.city == "some city"
      assert address.street == "some street"
      assert address.zip == "1234"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()

      update_attrs = %{
        city: "some updated city",
        zip: "4567"
      }

      assert {:ok, %Address{} = address} = @context.update_address(address, update_attrs)
      assert address.city == "some updated city"
      assert address.zip == "4567"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_address(address, @invalid_attrs)
      assert address == @context.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = @context.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> @context.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = @context.change_address(address)
    end
  end
end
