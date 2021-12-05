defmodule BalaErp.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :code, :string
      add :currency_id, references(:currencies, on_delete: :nothing)

      timestamps()
    end

    create index(:countries, [:currency_id])
    create unique_index(:countries, [:name, :code])
  end
end
