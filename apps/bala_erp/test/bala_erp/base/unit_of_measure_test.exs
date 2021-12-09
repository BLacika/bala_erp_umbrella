defmodule BalaErp.Base.UnitOfMeasureTest do
  use BalaErp.DataCase

  @context BalaErp.Base.UnitOfMeasure

  describe "uom" do
    alias BalaErp.Base.Schema.UnitOfMeasure

    import BalaErp.Base.UnitOfMeasureFixtures

    @invalid_attrs %{
      name: nil
    }

    test "list_uom/0 returns all uom" do
      unit_of_measure = unit_of_measure_fixture()
      assert @context.list_uom() == [unit_of_measure]
    end

    test "get_unit_of_measure!/1 returns the unit_of_measure with given id" do
      unit_of_measure = unit_of_measure_fixture()
      assert @context.get_unit_of_measure!(unit_of_measure.id) == unit_of_measure
    end

    test "create_unit_of_measure/1 with valid data creates a unit_of_measure" do
      valid_attrs = %{
        name: "some name"
      }

      assert {:ok, %UnitOfMeasure{} = unit_of_measure} = @context.create_unit_of_measure(valid_attrs)
      assert unit_of_measure.name == "some name"
    end

    test "create_unit_of_measure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = @context.create_unit_of_measure(@invalid_attrs)
    end

    test "update_unit_of_measure/2 with valid data updates the unit_of_measure" do
      unit_of_measure = unit_of_measure_fixture()
      update_attrs = %{
        name: "some updated name"
      }

      assert {:ok, %UnitOfMeasure{} = unit_of_measure} = @context.update_unit_of_measure(unit_of_measure, update_attrs)
      assert unit_of_measure.name == "some updated name"
    end

    test "update_unit_of_measure/2 with invalid data returns error changeset" do
      unit_of_measure = unit_of_measure_fixture()
      assert {:error, %Ecto.Changeset{}} = @context.update_unit_of_measure(unit_of_measure, @invalid_attrs)
      assert unit_of_measure == @context.get_unit_of_measure!(unit_of_measure.id)
    end

    test "delete_unit_of_measure/1 deletes the unit_of_measure" do
      unit_of_measure = unit_of_measure_fixture()
      assert {:ok, %UnitOfMeasure{}} = @context.delete_unit_of_measure(unit_of_measure)
      assert_raise Ecto.NoResultsError, fn -> @context.get_unit_of_measure!(unit_of_measure.id) end
    end

    test "change_unit_of_measure/1 returns a unit_of_measure changeset" do
      unit_of_measure = unit_of_measure_fixture()
      assert %Ecto.Changeset{} = @context.change_unit_of_measure(unit_of_measure)
    end
  end
end
