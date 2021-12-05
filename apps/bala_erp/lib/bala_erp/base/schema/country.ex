defmodule BalaErp.Base.Schema.Country do
  use Ecto.Schema
  import Ecto.Changeset

  @currency BalaErp.Base.Schema.Currency
  @addresses BalaErp.Base.Schema.Address

  schema "countries" do
    field :code, :string
    field :name, :string

    belongs_to :currency, @currency
    has_many :addresses, @addresses

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :code, :currency_id])
    |> validate_required([:name, :code, :currency_id])
    |> unique_constraint([:code, :name])
  end
end
