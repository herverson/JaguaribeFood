defmodule JfWeb.PageController do
  use JfWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
