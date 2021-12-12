defmodule BalaErp.Accounting.Schema.PaymentThermLine do
  use Ecto.Schema
  import Ecto.Changeset

  @payment_therm BalaErp.Accounting.Schema.PaymentTherm

  schema "payment_therm_lines" do
    field :number_of_days, :integer
    field :type, :string, default: "balance"
    field :value, :float

    belongs_to :payment_therm, @payment_therm

    timestamps()
  end

  @doc false
  def changeset(payment_therm_line, attrs) do
    payment_therm_line
    |> cast(attrs, [:type, :value, :number_of_days, :payment_therm_id])
    |> validate_required([:type, :value, :number_of_days])
    |> validate_inclusion(:type, ["balance", "percent", "fixed"])
  end
end
