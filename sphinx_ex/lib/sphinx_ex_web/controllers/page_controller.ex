defmodule SphinxExWeb.PageController do
  use SphinxExWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
