defmodule Volko.Pages.Page do
  alias Volko.Utils
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pages" do
    field :name, :string
    field :description, :string

    has_many :posts, Volko.Pages.Post
    many_to_many :admins, Volko.Accounts.User, join_through: "pages_admins"
    many_to_many :members, Volko.Accounts.User, join_through: "pages_admins"

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:name, :description])
    |> Utils.update_changes([:name, :description], &Utils.trim/1)
    |> validate_required([:name])
    |> validate_length(:name, max: 20)
    |> validate_length(:description, max: 200)
    |> validate_reserved_names()
  end

  @reserved_names [
    "VALORANT",
    "VALORANT ESPORTS",
    "LEAGUE OF LEGENDS",
    "LEAGUE OF LEGENDS ESPORTS",
    "TEAMFIGHT TACTICS",
    "TEAMFIGHT TACTICS ESPORTS",
    "FORTNITE",
    "FORTNITE ESPORTS",
    "HEARTHSTONE",
    "HEARTHSTONE ESPORTS",
    "DOTA 2",
    "DOTA 2 ESPORTS"
  ]

  defp validate_reserved_names(changeset) do
    name = get_field(changeset, :name)

    if name != nil && String.upcase(name) in @reserved_names do
      add_error(changeset, :name, "you choosed a reserved name")
    else
      changeset
    end
  end
end
