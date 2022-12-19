defmodule CarsWeb.CarControllerTest do
  use CarsWeb.ConnCase

  import Cars.CarsAvailableFixtures

  @create_attrs %{brand: "some brand", fabYear: 42, model: "some model", modelYear: 42, price: 120.5}
  @update_attrs %{brand: "some updated brand", fabYear: 43, model: "some updated model", modelYear: 43, price: 456.7}
  @invalid_attrs %{brand: nil, fabYear: nil, model: nil, modelYear: nil, price: nil}

  describe "index" do
    test "lists all carsavailable", %{conn: conn} do
      conn = get(conn, Routes.car_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Carsavailable"
    end
  end

  describe "new car" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.car_path(conn, :new))
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "create car" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.car_path(conn, :create), car: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.car_path(conn, :show, id)

      conn = get(conn, Routes.car_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Car"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.car_path(conn, :create), car: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "edit car" do
    setup [:create_car]

    test "renders form for editing chosen car", %{conn: conn, car: car} do
      conn = get(conn, Routes.car_path(conn, :edit, car))
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "update car" do
    setup [:create_car]

    test "redirects when data is valid", %{conn: conn, car: car} do
      conn = put(conn, Routes.car_path(conn, :update, car), car: @update_attrs)
      assert redirected_to(conn) == Routes.car_path(conn, :show, car)

      conn = get(conn, Routes.car_path(conn, :show, car))
      assert html_response(conn, 200) =~ "some updated brand"
    end

    test "renders errors when data is invalid", %{conn: conn, car: car} do
      conn = put(conn, Routes.car_path(conn, :update, car), car: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "delete car" do
    setup [:create_car]

    test "deletes chosen car", %{conn: conn, car: car} do
      conn = delete(conn, Routes.car_path(conn, :delete, car))
      assert redirected_to(conn) == Routes.car_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.car_path(conn, :show, car))
      end
    end
  end

  defp create_car(_) do
    car = car_fixture()
    %{car: car}
  end
end
