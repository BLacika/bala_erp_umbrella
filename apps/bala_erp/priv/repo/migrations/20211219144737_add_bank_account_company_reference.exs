defmodule BalaErp.Repo.Migrations.AddBankAccountCompanyReference do
  use Ecto.Migration

  def change do
    alter table(:bank_accounts) do
      add(:company_id, references(:companies, on_delete: :nothing))
    end

    create(index(:bank_accounts, [:company_id]))
  end
end
