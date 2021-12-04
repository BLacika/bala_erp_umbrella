defmodule BalaErp.Base.Schema.Rate do
  use Ecto.Schema
  import Ecto.Changeset

  @currency BalaErp.Base.Schema.Currency

  schema "rates" do
    field :date, :naive_datetime
    field :value, :float

    belongs_to :currency, @currency

    timestamps()
  end

  @doc false
  def changeset(rate, attrs) do
    rate
    |> cast(attrs, [:date, :value, :currency_id])
    |> validate_required([:date, :value, :currency_id])
    |> unique_constraint(:date)
  end
end
