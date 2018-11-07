defmodule JfWeb.Router do
  use JfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug JfWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  
  defimpl Phoenix.HTML.Safe, for: Map do
    def to_iodata(data), do: data |> Poison.encode! |> Plug.HTML.html_escape
  end

  scope "/", JfWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/enderecos", EnderecoController
    resources "/produtos", ProdutoController
    resources "/cardapios", CardapioController
    resources "/restaurantes", RestauranteController
    resources "/pedidos", PedidoController
    resources "/cart", CartController

  end

  scope "/auth", JfWeb do
    pipe_through :browser

    get "/signout", UserController, :signout
    get "/:provider", UserController, :request
    get "/:provider/callback", UserController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", JfWeb do
  #   pipe_through :api
  # end
end
