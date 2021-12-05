defmodule BalaErp.Base.CountryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Country` context.
  """

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        name: "Hungary",
        code: "hu",
        currency_id: get_currency_fixture().id
      })
      |> BalaErp.Base.Country.create_country()

    country
  end

  defp get_currency_fixture do
    BalaErp.Base.CurrencyFixtures.currency_fixture()
  end
end
