defmodule SphinxExWeb.Game.GameLive do
  use SphinxExWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end