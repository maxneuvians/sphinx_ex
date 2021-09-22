defmodule SphinxExWeb.Board.BoardLive do
  use SphinxExWeb, :live_component

  alias SphinxEx.Helpers.Board

  @impl true
  def mount(socket) do
    board =
      Board.new()
      |> Board.to_map()

    {:ok, assign(socket, board: board)}
  end

  @impl true
  def handle_event("action", %{"key" => key, "value" => value}, socket) do
    IO.inspect("#{key} =>  #{value}")
    {:noreply, socket}
  end
end
