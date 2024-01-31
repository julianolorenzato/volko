defmodule Volko.Repo.Migrations.CreateMembersTable do
  use Ecto.Migration

  def change do
    create table(:members, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :role, :string, null: false, default: "viewer"

      add :page_id, references(:pages, type: :binary_id, on_delete: :delete_all), null: false
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:members, [:page_id, :user_id])
  end
end
