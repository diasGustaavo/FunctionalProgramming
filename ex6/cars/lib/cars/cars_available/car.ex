defmodule Cars.CarsAvailable.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carsavailable" do
    field :brand, :string
    field :fabYear, :integer
    field :model, :string
    field :modelYear, :integer
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:brand, :model, :fabYear, :modelYear, :price])
    |> validate_required([:brand, :model, :fabYear, :modelYear, :price])
  end
end
