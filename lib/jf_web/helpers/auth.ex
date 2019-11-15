defmodule JfWeb.Helpers.Auth do

    def signed_in?(conn) do
        admin_id = Plug.Conn.get_session(conn, :current_admin_id)
        if admin_id, do: !!Jf.Repo.get(Jf.Admins.Admin, admin_id)
    end
    
end