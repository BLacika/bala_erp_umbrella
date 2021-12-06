defmodule BalaErp.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :name, :string
      add :active, :boolean, default: false, null: false
      add :code, :string
      add :decimal_separator, :string
      add :thousands_separator, :string
      add :date_format, :string
      add :time_format, :string

      timestamps()
    end

    create unique_index(:languages, [:name, :code])
  end
end
