defmodule BalaErp.Repo.Migrations.CreatePartnersTable do
  use Ecto.Migration

  def change do
    create table(:partners) do
      add :active, :boolean, default: false, null: false
      add :name, :string
      add :type, :string
      add :vat_number, :string
      add :eu_vat_number, :string
      add :has_member_vat, :boolean, default: false, null: false
      add :member_vat_number, :string
      add :personal_company, :boolean, default: false, null: false
      add :small_business, :boolean, default: false, null: false
      add :cash_basis, :boolean, default: false, null: false
      add :note, :string
      add :payment_therm_id, references(:payment_therms)
      add :currency_id, references(:currencies)
      add :language_id, references(:languages)

      timestamps()
    end

    create index(:partners, [:payment_therm_id, :currency_id, :language_id])
    create unique_index(:partners, [:vat_number, :type], where: "type != 'person'")
  end
end
