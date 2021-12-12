defmodule BalaErp.Repo.Migrations.AddPartnerReferenceToAddresses do
  use Ecto.Migration

  def change do
    alter table(:addresses) do
      add :partner_id, references(:partners, on_delete: :nothing)
    end

    create index(:addresses, [:partner_id])
  end
end
