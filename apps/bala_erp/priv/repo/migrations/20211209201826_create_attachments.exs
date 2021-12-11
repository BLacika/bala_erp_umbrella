defmodule BalaErp.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add :file, :string
      add :description, :string
      add :size, :string
      add :type, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:attachments, [:file])
  end
end
