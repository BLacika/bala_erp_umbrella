defmodule BalaErp.Repo.Migrations.ModifyAddressesField do
  use Ecto.Migration

  def change do
    rename table(:addresses), :country, to: :country_id
  end
end
