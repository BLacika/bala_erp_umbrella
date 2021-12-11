defmodule BalaErp.Base.Schema.Attachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attachments" do
    field :description, :string
    field :file, :string
    field :name, :string
    field :size, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(attachment, attrs) do
    attachment
    |> cast(attrs, [:file, :description, :size, :type, :name])
    |> validate_required([:file])
    |> unique_constraint([:file])
  end
end
