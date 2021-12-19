defmodule BalaErp.Base.Schema.Address do
  use Ecto.Schema
  import Ecto.Changeset

  @country BalaErp.Base.Schema.Country
  @partner BalaErp.Base.Schema.Partner
  @company BalaErp.Base.Schema.Company

  schema "addresses" do
    field(:name, :string)
    field(:active, :boolean, default: true)
    field(:city, :string)
    field(:state, :string)
    field(:street, :string)
    field(:zip, :string)

    belongs_to(:country, @country)
    belongs_to(:partner, @partner)
    belongs_to(:company, @company)

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [
      :name,
      :active,
      :street,
      :zip,
      :state,
      :city,
      :country_id,
      :partner_id,
      :company_id
    ])
    |> validate_required([:name, :country_id])
  end
end
