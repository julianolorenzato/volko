defmodule Volko.Pages.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :content, :string

    belongs_to :author, Volko.Accounts.User, foreign_key: :author_id
    belongs_to :post, Volko.Pages.Post

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
    |> validate_length(:content, min: 20, max: 5_000)
  end
end
