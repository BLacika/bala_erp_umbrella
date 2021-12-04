defmodule BalaErp.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :active, :boolean, default: false, null: false
      add :name, :string
      add :label, :string
      add :decimal_places, :integer
      add :symbol, :string
      add :symbol_position, :string

      timestamps()
    end

    create unique_index(:currencies, [:name])
  end
end
