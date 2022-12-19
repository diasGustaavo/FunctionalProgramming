defmodule Cars.CarsAvailableFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cars.CarsAvailable` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        fabYear: 42,
        model: "some model",
        modelYear: 42,
        price: 120.5
      })
      |> Cars.CarsAvailable.create_car()

    car
  end
end
