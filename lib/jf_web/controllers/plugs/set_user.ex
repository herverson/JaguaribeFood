defmodule JfWeb.Plugs.SetUser do
  import Plug.Conn
  # import Phoenix.Controller

  alias Jf.Repo
  alias Jf.Accounts.User
  # alias Jf.Router.Helpers

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign conn, :user, user
      true ->
        assign conn, :user, nil
    end
  end
end
