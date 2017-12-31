defmodule ApiServerWeb.UserController do
    use ApiServerWeb, :controller
    alias ApiServer.Accounts

    def index(conn, params) do
        users = Accounts.list_users
        render(conn, "index.json", users: users )
    end
end