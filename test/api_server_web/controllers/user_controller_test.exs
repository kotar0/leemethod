defmodule ApiServerWeb.UserControllerTest do
    use ApiServerWeb.ConnCase

    setup_all do
        IO.puts("setup all")
    end

    setup do
        IO.puts("setup")
    end

    describe "index" do
        test "Get list all users", %{conn: conn} do
            conn = get(conn, user_path(conn, :index))
            assert json_response(conn, 200)["data"] == []
        end

        test "test2" do
            IO.puts("test2")
        end
    end
end