defmodule BalaErp.Base.LanguageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Language` context.
  """

  @doc """
  Generate a language.
  """
  def language_fixture(attrs \\ %{}) do
    {:ok, language} =
      attrs
      |> Enum.into(%{
        active: true,
        code: "hun",
        date_format: "yyyy.MM.dd",
        decimal_separator: ",",
        name: "Hungarian",
        thousands_separator: ".",
        time_format: "hh:mm:ss"
      })
      |> BalaErp.Base.Language.create_language()

    language
  end
end
