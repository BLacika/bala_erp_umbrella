defmodule BalaErp.Base.RateFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Rate` context.
  """

  @doc """
  Generate a rate.
  """
  def rate_fixture(attrs \\ %{}) do
    {:ok, rate} =
      attrs
      |> Enum.into(%{
        date: NaiveDateTime.utc_now(),
        value: 355.15,
        currency_id: get_currency_fixture().id
      })
      |> BalaErp.Base.Rate.create_rate()

    rate
  end

  defp get_currency_fixture do
    BalaErp.Base.CurrencyFixtures.currency_fixture()
  end
end
