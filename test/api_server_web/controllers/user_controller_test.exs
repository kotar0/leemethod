defmodule ApiServerWeb.UserControllerTest do
    use ApiServerWeb.ConnCase
    alias ApiServer.Accounts.User

    @create_attrs %{name: "testuser", age: 20}
    @update_attrs %{name: "testuser2", age: 25}

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
            assert json_response(conn, 200)["data"] == %{"id" => id, "name" => "testuser", "age" => 20}
        end
    end

    describe  "update" do
        setup [:create_user]

        test "Update user", %{conn: conn, user: %User{id: id}} do
            conn = put(conn, user_path(conn, :update, id), user: @update_attrs )
            assert json_response(conn, 200)["data"] == %{"id" => id, "name" => "testuser2", "age" => 25}
        end
        
    end

    describe "delete" do
        setup [:create_user]

        test "Delete user", %{conn: conn, user: %User{id: id}} do
            conn = delete(conn, user_path(conn, :delete, id))
            assert response(conn, 204)
        end
        
    end

    defp create_user(_) do
        {:ok, user} = ApiServer.Accounts.create_user(@create_attrs)
        {:ok, user: user}
    end
end