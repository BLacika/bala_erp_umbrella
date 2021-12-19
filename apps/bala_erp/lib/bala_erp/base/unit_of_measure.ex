defmodule BalaErp.Base.UnitOfMeasure do
  @moduledoc """
  The Base.UnitOfMeasure context.
  """

  import Ecto.Query, warn: false
  alias BalaErp.Repo

  alias BalaErp.Base.Schema.UnitOfMeasure

  @doc """
  Returns the list of uom.

  ## Examples

      iex> list_uom()
      [%UnitOfMeasure{}, ...]

  """
  def list_uom do
    Repo.all(UnitOfMeasure)
  end

  @doc """
  Gets a single unit_of_measure.

  Raises if the Unit of measure does not exist.

  ## Examples

      iex> get_unit_of_measure!(123)
      %UnitOfMeasure{}

  """
  def get_unit_of_measure!(id), do: Repo.get!(UnitOfMeasure, id)

  @doc """
  Creates a unit_of_measure.

  ## Examples

      iex> create_unit_of_measure(%{field: value})
      {:ok, %UnitOfMeasure{}}

      iex> create_unit_of_measure(%{field: bad_value})
      {:error, ...}

  """
  def create_unit_of_measure(attrs \\ %{}) do
    %UnitOfMeasure{}
    |> UnitOfMeasure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a unit_of_measure.

  ## Examples

      iex> update_unit_of_measure(unit_of_measure, %{field: new_value})
      {:ok, %UnitOfMeasure{}}

      iex> update_unit_of_measure(unit_of_measure, %{field: bad_value})
      {:error, ...}

  """
  def update_unit_of_measure(%UnitOfMeasure{} = unit_of_measure, attrs) do
    unit_of_measure
    |> UnitOfMeasure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UnitOfMeasure.

  ## Examples

      iex> delete_unit_of_measure(unit_of_measure)
      {:ok, %UnitOfMeasure{}}

      iex> delete_unit_of_measure(unit_of_measure)
      {:error, ...}

  """
  def delete_unit_of_measure(%UnitOfMeasure{} = unit_of_measure) do
    Repo.delete(unit_of_measure)
  end

  @doc """
  Returns a data structure for tracking unit_of_measure changes.

  ## Examples

      iex> change_unit_of_measure(unit_of_measure)
      %Todo{...}

  """
  def change_unit_of_measure(%UnitOfMeasure{} = unit_of_measure, attrs \\ %{}) do
    UnitOfMeasure.changeset(unit_of_measure, attrs)
  end
end
