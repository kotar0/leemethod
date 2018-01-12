defmodule ApiServer.Accounts do
    @moduledoc """
    The Accounts context
    """

    import Ecto.Query, warn: false
    alias ApiServer.Repo
    alias ApiServer.Accounts.User

    def list_users do
        Repo.all(User)
    end

    def create_user(attrs \\ %{}) do
        %User{}
        |> User.changeset(attrs)
        |> Repo.insert()
    end

    def get_user!(id) do
        Repo.get!(User, id)
    end

    def update_user(id, attrs \\ %{}) do
        get_user!(id)
        |> User.changeset(attrs)
        |> Repo.update()
    end

    def delete_user(id) do
        get_user!(id)
        |> Repo.delete()        
    end
end