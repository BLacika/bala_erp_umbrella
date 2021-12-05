defmodule BalaErp.Base.Schema.Address do
  use Ecto.Schema
  import Ecto.Changeset

  @country BalaErp.Base.Schema.Country

  schema "addresses" do
    field :name, :string
    field :active, :boolean, default: true
    field :city, :string
    field :state, :string
    field :street, :string
    field :zip, :string

    belongs_to :country, @country

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:name, :active, :street, :zip, :state, :city, :country_id])
    |> validate_required([:name, :country_id])
  end
end
