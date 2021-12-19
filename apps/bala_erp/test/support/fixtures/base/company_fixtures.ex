defmodule BalaErp.Base.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Company` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        eu_vat_number: "HU12345678",
        name: "My Awesome Company",
        vat_number: "12345678-9-10"
      })
      |> BalaErp.Base.Company.create_company()

    company
  end
end
