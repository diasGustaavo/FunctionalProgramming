defmodule Cars.CarsAvailableTest do
  use Cars.DataCase

  alias Cars.CarsAvailable

  describe "carsavailable" do
    alias Cars.CarsAvailable.Car

    import Cars.CarsAvailableFixtures

    @invalid_attrs %{brand: nil, fabYear: nil, model: nil, modelYear: nil, price: nil}

    test "list_carsavailable/0 returns all carsavailable" do
      car = car_fixture()
      assert CarsAvailable.list_carsavailable() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert CarsAvailable.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      valid_attrs = %{brand: "some brand", fabYear: 42, model: "some model", modelYear: 42, price: 120.5}

      assert {:ok, %Car{} = car} = CarsAvailable.create_car(valid_attrs)
      assert car.brand == "some brand"
      assert car.fabYear == 42
      assert car.model == "some model"
      assert car.modelYear == 42
      assert car.price == 120.5
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CarsAvailable.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      update_attrs = %{brand: "some updated brand", fabYear: 43, model: "some updated model", modelYear: 43, price: 456.7}

      assert {:ok, %Car{} = car} = CarsAvailable.update_car(car, update_attrs)
      assert car.brand == "some updated brand"
      assert car.fabYear == 43
      assert car.model == "some updated model"
      assert car.modelYear == 43
      assert car.price == 456.7
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = CarsAvailable.update_car(car, @invalid_attrs)
      assert car == CarsAvailable.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = CarsAvailable.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> CarsAvailable.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = CarsAvailable.change_car(car)
    end
  end
end
