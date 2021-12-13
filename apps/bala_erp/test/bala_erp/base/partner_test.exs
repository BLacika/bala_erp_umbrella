defmodule BalaErp.Base.PartnerTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Partner

  describe "partners" do
    alias BalaErp.Base.Schema.Partner

    import BalaErp.Base.PartnerFixtures

    @invalid_attrs %{
      name: nil,
      vat_number: nil
    }

    test "list_partners/0 returns all partners" do
      partner = partner_fixture()
      assert @context.list_partners() == [partner]
    end

    test "get_partner!/1 returns the partner with given id" do
      partner = partner_fixture()
      assert @context.get_partner!(partner.id) == partner
    end

    test "create_partner/1 with valid data creates a partner" do
      valid_attrs = %{
        name: "Some name",
        type: "person"
      }

      assert {:ok, %Partner{} = partner} = @context.create_partner(valid_attrs)
      assert partner.name == "Some name"
      assert partner.type == "person"
    end

    test "create_partner/1 creates partner and check vat_number validation" do
      person_attrs = %{
        name: "John Smith",
        type: "person"
      }
      company_attrs = %{
        name: "Test Company",
        type: "company",
        vat_number: "12345678-9-10"
      }

      assert {:ok, %Partner{} = partner1} = @context.create_partner(person_attrs)
      assert {:ok, %Partner{} = partner2} = @context.create_partner(company_attrs)
    end

    test "create_partner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_partner(@invalid_attrs)
    end

    test "create_partner/1 creates a company without vat_number and expecting error" do
      company_attrs = %{
        name: "Test Company",
        type: "company",
      }

      assert {:error, %Ecto.Changeset{}} = @context.create_partner(company_attrs)
    end

    test "update_partner/2 with valid data updates the partner" do
      partner = partner_fixture()
      update_attrs = %{
        name: "Some updated name",
        cash_basis: true
      }

      assert {:ok, %Partner{} = partner} = @context.update_partner(partner, update_attrs)
      assert partner.name == "Some updated name"
      assert partner.cash_basis == true
    end

    test "update_partner/2 with invalid data returns error changeset" do
      partner = partner_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_partner(partner, @invalid_attrs)
      assert partner == @context.get_partner!(partner.id)
    end

    test "delete_partner/1 deletes the partner" do
      partner = partner_fixture()
      assert {:ok, %Partner{}} = @context.delete_partner(partner)
      assert_raise Ecto.NoResultsError, fn -> @context.get_partner!(partner.id) end
    end

    test "change_partner/1 returns a partner changeset" do
      partner = partner_fixture()
      assert %Ecto.Changeset{} = @context.change_partner(partner)
    end
  end
end
