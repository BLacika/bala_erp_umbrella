defmodule BalaErp.Repo.Migrations.CreateBankAccounts do
  use Ecto.Migration

  def change do
    create table(:bank_accounts) do
      add :name, :string
      add :account_number, :string
      add :bank, :string
      add :bank_identifier, :string
      add :partner_id, references(:partners, on_delete: :nothing)

      timestamps()
    end

    create index(:bank_accounts, [:partner_id])
    create unique_index(:bank_accounts, [:account_number])
  end
end
