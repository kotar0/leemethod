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

    def show(conn, %{"id" => id}) do
        user = Accounts.get_user!(id)
        render(conn, "show.json", user: user)
    end

    def update(conn, %{"id" => id, "user" => user_param}) do
        {:ok, user} = Accounts.update_user(id, user_param)
        render(conn, "show.json", "user": user)
    end
end