defmodule BalaErp.Base.UnitOfMeasureFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.UnitOfMeasure` context.
  """

  @doc """
  Generate a unit_of_measure.
  """
  def unit_of_measure_fixture(attrs \\ %{}) do
    {:ok, unit_of_measure} =
      attrs
      |> Enum.into(%{
        name: "kg"
      })
      |> BalaErp.Base.UnitOfMeasure.create_unit_of_measure()

    unit_of_measure
  end
end
