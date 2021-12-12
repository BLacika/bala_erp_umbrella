defmodule BalaErp.Base.Schema.Partner do
  use Ecto.Schema
  import Ecto.Changeset

  @bank_account BalaErp.Accounting.Schema.BankAccount
  @addresses BalaErp.Base.Schema.Address
  @payment_therm BalaErp.Accounting.Schema.PaymentTherm
  @currency BalaErp.Base.Schema.Currency
  @language BalaErp.Base.Schema.Language

  schema "partners" do
    field :active, :boolean, default: true
    field :cash_basis, :boolean, default: false
    field :eu_vat_number, :string
    field :has_member_vat, :boolean, default: false
    field :member_vat_number, :string
    field :name, :string
    field :note, :string
    field :personal_company, :boolean, default: false
    field :small_business, :boolean, default: false
    field :type, :string, default: "customer"
    field :vat_number, :string

    has_many :bank_accounts, @bank_account
    has_many :addresses, @addresses
    belongs_to :payment_therm, @payment_therm
    belongs_to :currency, @currency
    belongs_to :language, @language

    timestamps()
  end

  @doc false
  def changeset(partner, attrs) do
    partner
    |> cast(attrs, [
      :active,
      :name,
      :type,
      :vat_number,
      :eu_vat_number,
      :has_member_vat,
      :member_vat_number,
      :personal_company,
      :small_business,
      :cash_basis,
      :note,
      :payment_therm_id,
      :currency_id,
      :language_id
    ])
    |> validate_required([:name, :type])
    |> validate_inclusion(:type, ["person", "customer", "vendor"])
    |> validate_vat_number()
  end

  defp validate_vat_number(changeset) do
    type = get_field(changeset, :type)

    case type do
      "person" ->
        changeset
      _ ->
        changeset
        |> validate_required([:vat_number])
        |> unique_constraint(:vat_number)
    end
  end
end

