defmodule Temp.Web.PageController do
  use Temp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
