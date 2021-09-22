defmodule SphinxExWeb.PageLive do
  use SphinxExWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end
end
