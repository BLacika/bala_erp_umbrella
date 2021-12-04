defmodule BalaErp.Repo.Migrations.CreateRates do
  use Ecto.Migration

  def change do
    create table(:rates) do
      add :date, :naive_datetime
      add :value, :float
      add :currency_id, references(:currencies, on_delete: :delete_all)

      timestamps()
    end

    create index(:rates, [:currency_id])
    create unique_index(:rates, [:date])
  end
end
