defmodule BalaErp.Repo.Migrations.AddAddressesCompanyReference do
  use Ecto.Migration

  def change do
    alter table(:addresses) do
      add(:company_id, references(:companies, on_delete: :nothing))
    end

    create(index(:addresses, [:company_id]))
  end
end
