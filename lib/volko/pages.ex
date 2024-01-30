defmodule Volko.Pages do
  alias Volko.Repo
  alias Volko.Pages.Page

  def change_page(%Page{} = page, attrs \\ %{}) do
    Page.changeset(page, attrs)
  end

  def create_page(attrs) do
    %Page{}
    |> Page.changeset(attrs)
    |> Repo.insert()
  end

  def retrieve_page(id), do: Repo.get(Page, id)

  def retrieve_pages, do: Repo.all(Page)
end
