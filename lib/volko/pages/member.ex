defmodule Volko.Pages.Member do
  use Ecto.Schema
  import Ecto.Changeset

  @role_enum [:owner, :admin, :partner, :viewer]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    field :role, Ecto.Enum, values: @role_enum, default: :viewer

    belongs_to :user, Volko.Accounts.User
    belongs_to :page, Volko.Pages.Page

    timestamps()
  end

  def changeset_roles(role, attrs) do
    role
    |> cast(attrs, [:role])
    |> validate_inclusion(:role, @role_enum)
  end
end
