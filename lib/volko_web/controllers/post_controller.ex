defmodule VolkoWeb.PostController do
  use VolkoWeb, :controller

  def new(conn, _params) do
    render(conn, :new)
  end
end
