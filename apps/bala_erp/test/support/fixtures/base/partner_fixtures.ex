defmodule BalaErp.Base.PartnerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Partner` context.
  """

  @doc """
  Generate a partner.
  """
  def partner_fixture(attrs \\ %{}) do
    {:ok, partner} =
      attrs
      |> Enum.into(%{
        active: true,
        cash_basis: false,
        eu_vat_number: "",
        has_member_vat: false,
        member_vat_number: "",
        name: "Teszt Partner",
        note: "Some note",
        personal_company: false,
        small_business: false,
        type: "company",
        vat_number: "12345678-9-10"
      })
      |> BalaErp.Base.Partner.create_partner()

    partner
  end
end
