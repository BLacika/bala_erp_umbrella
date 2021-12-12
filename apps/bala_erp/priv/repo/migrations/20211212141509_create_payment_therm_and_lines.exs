defmodule BalaErp.Repo.Migrations.CreatePaymentThermLines do
  use Ecto.Migration

  def change do
    create table(:payment_therms) do
      add :name, :string
      add :description_on_invoice, :string

      timestamps()
    end
  end

  def change do
    create table(:payment_therm_lines) do
      add :type, :string
      add :value, :float
      add :number_of_days, :integer
      add :payment_therm_id, references(:payment_therms, on_delete: :nothing)

      timestamps()
    end

    create index(:payment_therm_lines, [:payment_therm_id])
  end
end
