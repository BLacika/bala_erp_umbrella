defmodule BalaErp.Base.Schema.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @currency BalaErp.Base.Schema.Currency
  @language BalaErp.Base.Schema.Language
  @bank_account BalaErp.Accounting.Schema.BankAccount
  @address BalaErp.Base.Schema.Address

  schema "companies" do
    field :eu_vat_number, :string
    field :has_member_vat, :boolean, default: false
    field :is_cash_basis, :boolean, default: false
    field :is_personal_company, :boolean, default: false
    field :is_small_business, :boolean, default: false
    field :member_vat_number, :string
    field :name, :string
    field :vat_number, :string

    belongs_to :currency, @currency
    belongs_to :language, @language

    has_many :bank_accounts, @bank_account
    has_many :addresses, @address

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [
      :name,
      :vat_number,
      :eu_vat_number,
      :has_member_vat,
      :member_vat_number,
      :is_personal_company,
      :is_small_business,
      :is_cash_basis,
      :currency_id,
      :language_id
    ])
    |> validate_required([
      :name,
      :vat_number
    ])
    |> unique_constraint([:name, :vat_number])
  end
end
