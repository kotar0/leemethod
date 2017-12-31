defmodule ApiServerWeb.UserControllerTest do
    use ApiServerWeb.ConnCase
    @create_attrs %{name: "testuser", age: 20}

    describe "index" do
        test "Get list all users", %{conn: conn} do
            conn = get(conn, user_path(conn, :index))
            assert json_response(conn, 200)["data"] == []
        end
    end

    describe "create" do
        test "Create User", %{conn: conn} do
            conn = post(conn, user_path(conn, :create), @create_attrs)
            assert %{"id" => id} = json_response(conn, 201)["data"]
        end
    end
end