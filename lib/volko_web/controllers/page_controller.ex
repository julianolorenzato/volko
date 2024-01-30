defmodule VolkoWeb.PageController do
  use VolkoWeb, :controller

  alias Volko.Pages.Page
  alias Volko.Pages

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    pages = Pages.retrieve_pages()

    posts = [
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"},
      %{title: "AEAEAEAS"}
    ]

    render(conn, :home, pages: pages, posts: posts)
  end

  def new(conn, _params) do
    changeset = Pages.change_page(%Page{})
    render(conn, :new, changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    result = Pages.retrieve_page(id)

    case result do
      nil ->
        conn
        |> put_flash(:error, "No page found with id #{id}")
        |> redirect(to: ~p"/")

      page ->
        render(conn, :show, page: page)
    end
  end

  def create(conn, %{"page" => page_params}) do
    result = Pages.create_page(page_params)

    case result do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Page #{page.name} created successfully")
        |> redirect(to: ~p"/pages/#{page.id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
