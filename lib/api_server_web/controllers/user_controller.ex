defmodule ApiServerWeb.UserController do
    use ApiServerWeb, :controller
    alias ApiServer.Accounts
    alias ApiServer.Accounts.User

    def index(conn, params) do
        users = Accounts.list_users
        render(conn, "index.json", users: users )
    end

    def create(conn, params) do
        {:ok, %User{} = user} = Accounts.create_user(params)
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
    end
end