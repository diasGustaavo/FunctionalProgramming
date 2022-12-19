defmodule CarsWeb.CarController do
  use CarsWeb, :controller

  alias Cars.CarsAvailable
  alias Cars.CarsAvailable.Car

  def index(conn, _params) do
    carsavailable = CarsAvailable.list_carsavailable()
    render(conn, "index.html", carsavailable: carsavailable)
  end

  def new(conn, _params) do
    changeset = CarsAvailable.change_car(%Car{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"car" => car_params}) do
    case CarsAvailable.create_car(car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car created successfully.")
        |> redirect(to: Routes.car_path(conn, :show, car))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    car = CarsAvailable.get_car!(id)
    render(conn, "show.html", car: car)
  end

  def edit(conn, %{"id" => id}) do
    car = CarsAvailable.get_car!(id)
    changeset = CarsAvailable.change_car(car)
    render(conn, "edit.html", car: car, changeset: changeset)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = CarsAvailable.get_car!(id)

    case CarsAvailable.update_car(car, car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car updated successfully.")
        |> redirect(to: Routes.car_path(conn, :show, car))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", car: car, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = CarsAvailable.get_car!(id)
    {:ok, _car} = CarsAvailable.delete_car(car)

    conn
    |> put_flash(:info, "Car deleted successfully.")
    |> redirect(to: Routes.car_path(conn, :index))
  end
end
