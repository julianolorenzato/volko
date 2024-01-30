defmodule VolkoWeb.Nothing do
  use VolkoWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>NOTHING</h1>
    <.link navigate={~p"/counter/2"}>To counter</.link>
    """
  end
end
