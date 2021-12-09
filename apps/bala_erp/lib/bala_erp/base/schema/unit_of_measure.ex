defmodule BalaErp.Base.Schema.UnitOfMeasure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "uom" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(unit_of_measure, attrs) do
    unit_of_measure
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])    
  end
end
