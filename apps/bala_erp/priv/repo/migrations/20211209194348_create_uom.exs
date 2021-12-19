defmodule BalaErp.Repo.Migrations.CreateUom do
  use Ecto.Migration

  def change do
    create table(:uom) do
      add :name, :string

      timestamps()
    end

    create unique_index(:uom, [:name])
  end
end
