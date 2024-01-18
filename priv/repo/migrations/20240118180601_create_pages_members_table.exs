defmodule Volko.Repo.Migrations.CreatePagesMembersTable do
  use Ecto.Migration

  def change do
    create table(:pages_members) do
      add :page_id, references(:pages, type: :binary_id, on_delete: :delete_all), null: false
      add :member_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false
    end

    create unique_index(:pages_members, [:page_id, :member_id])
  end
end
