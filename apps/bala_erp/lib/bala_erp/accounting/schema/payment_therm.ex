defmodule BalaErp.Accounting.Schema.PaymentTherm do
  use Ecto.Schema
  import Ecto.Changeset

  @payment_therm_line BalaErp.Accounting.Schema.PaymentThermLine
  @partner BalaErp.Base.Schema.Partner

  schema "payment_therms" do
    field :description_on_invoice, :string
    field :name, :string

    has_many :payment_therm_lines, @payment_therm_line
    has_many :partners, @partner

    timestamps()
  end

  @doc false
  def changeset(payment_therm, attrs) do
    payment_therm
    |> cast(attrs, [:name, :description_on_invoice])
    |> validate_required([:name, :description_on_invoice])
  end
end
