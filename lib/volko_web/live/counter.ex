defmodule VolkoWeb.Counter do
  use VolkoWeb, :live_view

  def render(assigns) do
    ~H"""
    <%!-- <p class="mb-4"><%= inspect(@session) %></p> --%>
    <h1>Counter: <%= @value %></h1>
    <button class="bg-black rounded-md text-white hover:bg-gray-800 p-2" phx-click="increment">
      Increment
    </button>
    <.link navigate={~p"/nothing"}>To nothing</.link>
    """
  end

  def mount(%{"start_value" => start_value}, session, socket) do
    {:ok, assign(socket, value: String.to_integer(start_value), session: session)}
  end

  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :value, &(&1 + 1))}
  end
end
