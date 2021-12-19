defmodule BalaErp.Base.Schema.Currency do
  use Ecto.Schema
  import Ecto.Changeset

  @rates BalaErp.Base.Schema.Rate
  @countries BalaErp.Base.Schema.Country
  @partner BalaErp.Base.Schema.Partner
  @company BalaErp.Base.Schema.Company

  schema "currencies" do
    field(:active, :boolean, default: false)
    field(:decimal_places, :integer, default: 2)
    field(:label, :string)
    field(:name, :string)
    field(:symbol, :string)
    field(:symbol_position, :string, default: "before")

    has_many(:rates, @rates)
    has_many(:countries, @countries)
    has_many(:partners, @partner)
    has_many(:companies, @company)

    timestamps()
  end

  @doc false
  def changeset(currency, attrs) do
    currency
    |> cast(attrs, [:active, :name, :label, :decimal_places, :symbol, :symbol_position])
    |> validate_required([:name, :label])
    |> validate_inclusion(:symbol_position, ["before", "after"])
    |> unique_constraint(:name)
  end
end
