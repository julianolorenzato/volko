defmodule Volko.Pages do
  alias Volko.Pages.Member
  alias Volko.Repo
  alias Volko.Pages.Page

  def change_page(%Page{} = page, attrs \\ %{}) do
    Page.changeset(page, attrs)
  end

  def create_page(attrs, current_user) do
    member =
      %Member{}
      |> Member.changeset_roles(%{role: :owner})
      |> Ecto.Changeset.put_assoc(:user, current_user)

    page =
      %Page{}
      |> Page.changeset(attrs)
      |> Ecto.Changeset.put_assoc(:members, [member])

    IO.inspect(page, label: "pagerrrrrrrrrrrr")

    Repo.insert(page)
  end

  def retrieve_page(id), do: Repo.get(Page, id)

  def retrieve_pages, do: Repo.all(Page)
end
