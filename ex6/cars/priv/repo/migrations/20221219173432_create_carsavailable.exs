defmodule Cars.Repo.Migrations.CreateCarsavailable do
  use Ecto.Migration

  def change do
    create table(:carsavailable) do
      add :brand, :string
      add :model, :string
      add :fabYear, :integer
      add :modelYear, :integer
      add :price, :float

      timestamps()
    end
  end
end
