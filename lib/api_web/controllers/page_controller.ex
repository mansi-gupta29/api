defmodule ApiWeb.PageController do
  use ApiWeb, :controller

  def index(conn, _params) do
    data = Api.Worker.get()

    render(conn, "data.json", data: data)
  end
end
