defmodule Volko.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :page_id, :binary_id, references(:pages, type: :uuid)

      timestamps()
    end
  end
end
