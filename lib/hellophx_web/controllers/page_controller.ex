defmodule HellophxWeb.PageController do
  use HellophxWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
