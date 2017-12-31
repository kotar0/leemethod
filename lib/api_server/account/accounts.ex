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
end