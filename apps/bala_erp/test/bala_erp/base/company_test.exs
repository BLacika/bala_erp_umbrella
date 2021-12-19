defmodule BalaErp.Base.CompanyTest do
  use BalaErp.DataCase

  @context BalaErp.Base.Company

  describe "companies" do
    alias BalaErp.Base.Schema.Company

    import BalaErp.Base.CompanyFixtures

    @invalid_attrs %{
      name: nil,
      vat_number: nil
    }

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert @context.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert @context.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{
        name: "some company",
        vat_number: "some vatnumber",
        eu_vat_number: "some eu vat number"
      }

      assert {:ok, %Company{} = company} = @context.create_company(valid_attrs)
      assert company.name == "some company"
      assert company.vat_number == "some vatnumber"
      assert company.eu_vat_number == "some eu vat number"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()

      update_attrs = %{
        name: "updated name",
        vat_number: "updated vatnumber"
      }

      assert {:ok, %Company{} = company} = @context.update_company(company, update_attrs)
      assert company.name == "updated name"
      assert company.vat_number == "updated vatnumber"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_company(company, @invalid_attrs)
      assert company == @context.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = @context.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> @context.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = @context.change_company(company)
    end
  end
end
