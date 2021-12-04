defmodule BalaErp.Base.CurrencyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Currency` context.
  """

  @doc """
  Generate a currency.
  """
  def currency_fixture(attrs \\ %{}) do
    {:ok, currency} =
      attrs
      |> Enum.into(%{
        active: true,
        label: "HUF",
        name: "Forint",
        symbol: "Ft",
        symbol_position: "after"
      })
      |> BalaErp.Base.Currency.create_currency()

    currency
  end
end
