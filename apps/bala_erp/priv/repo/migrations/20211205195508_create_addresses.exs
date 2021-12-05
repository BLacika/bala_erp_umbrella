defmodule BalaErp.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :name, :string
      add :active, :boolean, default: false, null: false
      add :street, :string
      add :zip, :string
      add :state, :string
      add :city, :string
      add :country, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:addresses, [:country])
  end
end
