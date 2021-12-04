defmodule BalaErpWeb.PageController do
  use BalaErpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
