defmodule BalaErp.Base.AttachmentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BalaErp.Base.Attachment` context.
  """

  @doc """
  Generate a attachment.
  """
  def attachment_fixture(attrs \\ %{}) do
    {:ok, attachment} =
      attrs
      |> Enum.into(%{
        file: "file path",
        description: "a pdf file",
        name: "some file name",
        size: "124kb",
        type: "pdf"
      })
      |> BalaErp.Base.Attachment.create_attachment()

    attachment
  end
end
