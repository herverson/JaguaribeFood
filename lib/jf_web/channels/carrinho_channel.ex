defmodule JfWeb.CarrinhoChannel do
  use JfWeb, :channel

  alias Jf.Vendas

  def join("carrinho:lobby", _payload, socket) do
      {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (carrinho:lobby).
  def handle_in("shout", payload, socket) do
    Vendas.create_cart(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
