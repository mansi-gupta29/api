defmodule ApiWeb.PageView do
  use ApiWeb, :view

  def render("data.json", %{data: data}) do
    data
  end
end
