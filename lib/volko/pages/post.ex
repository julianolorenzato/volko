defmodule Volko.Pages.Post do
  alias Volko.Utils
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :title, :string
    field :body, :string

    belongs_to :page, Volko.Pages.Page
    has_many :comments, Volko.Pages.Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> update_change(:title, &Utils.trim/1)
    |> update_change(:body, &Utils.trim/1)
    |> validate_required([:title, :body])
    |> validate_length(:title, max: 40)
    |> validate_length(:body, min: 20, max: 20_000)
  end
end
