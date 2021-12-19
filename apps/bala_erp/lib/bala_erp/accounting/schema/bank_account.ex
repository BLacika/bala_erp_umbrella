defmodule BalaErp.Accounting.Schema.BankAccount do
  use Ecto.Schema
  import Ecto.Changeset

  @partner BalaErp.Base.Schema.Partner
  @company BalaErp.Base.Schema.Company

  schema "bank_accounts" do
    field(:account_number, :string)
    field(:bank, :string)
    field(:bank_identifier, :string)
    field(:name, :string)

    belongs_to(:partner, @partner)
    belongs_to(:company, @company)

    timestamps()
  end

  @doc false
  def changeset(bank_account, attrs) do
    bank_account
    |> cast(attrs, [:name, :account_number, :bank, :bank_identifier, :partner_id, :company_id])
    |> validate_required([:name, :account_number, :bank, :bank_identifier])
    |> unique_constraint(:account_number)
  end
end
