defmodule BalaErp.Base.AddressFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Address` context.
  """

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        name: "Lakcím",
        city: "Budapest",
        street: "József Attila u. 3.",
        country_id: get_country_fixture().id
      })
      |> BalaErp.Base.Address.create_address()

    address
  end

  defp get_country_fixture do
    BalaErp.Base.CountryFixtures.country_fixture()
  end
end
