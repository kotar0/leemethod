defmodule ApiServerWeb.UserControllerTest do
    use ApiServerWeb.ConnCase
    alias ApiServer.Accounts.User

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

    describe "show" do
        setup [:create_user]

        test "Show user", %{conn: conn, user: %User{id: id}} do
            conn = get(conn, user_path(conn, :show, id))
            assert json_response(conn, 200)["data"] == %{id: id, name: "testuser", age: 20}
        end
    end

    defp create_user(_) do
        {:ok, user} = ApiServer.Accounts.create_user(@create_attrs)
        {:ok, user: user}
    end
end