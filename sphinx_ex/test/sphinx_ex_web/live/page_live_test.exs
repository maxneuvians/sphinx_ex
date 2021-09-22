defmodule SphinxExWeb.PageLiveTest do
  use SphinxExWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "SphinxEx · Phoenix Framework"
    assert render(page_live) =~ "Hello"
  end
end
