defmodule BalaErp.Base.Schema.Language do
  use Ecto.Schema
  import Ecto.Changeset

  @partner BalaErp.Base.Schema.Partner
  @company BalaErp.Base.Schema.Company

  schema "languages" do
    field(:active, :boolean, default: false)
    field(:code, :string)
    field(:date_format, :string)
    field(:decimal_separator, :string)
    field(:name, :string)
    field(:thousands_separator, :string)
    field(:time_format, :string)

    has_many(:partners, @partner)
    has_many(:companies, @company)

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [
      :name,
      :active,
      :code,
      :decimal_separator,
      :thousands_separator,
      :date_format,
      :time_format
    ])
    |> validate_required([
      :name,
      :code,
      :decimal_separator,
      :thousands_separator,
      :date_format,
      :time_format
    ])
    |> unique_constraint([:name, :code])
  end
end
