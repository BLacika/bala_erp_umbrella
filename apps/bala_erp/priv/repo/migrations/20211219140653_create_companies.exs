defmodule BalaErp.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :vat_number, :string
      add :eu_vat_number, :string
      add :has_member_vat, :boolean, default: false, null: false
      add :member_vat_number, :string
      add :is_personal_company, :boolean, default: false, null: false
      add :is_small_business, :boolean, default: false, null: false
      add :is_cash_basis, :boolean, default: false, null: false
      add :currency_id, references(:currencies, on_delete: :nothing)
      add :language_id, references(:languages, on_delete: :nothing)

      timestamps()
    end

    create index(:companies, [:currency_id])
    create index(:companies, [:language_id])
    create unique_index(:companies, [:name, :vat_number])
  end
end
