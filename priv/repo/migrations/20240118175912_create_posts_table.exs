defmodule Volko.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :body, :string, null: false

      add :page_id, references(:pages, type: :binary_id, on_delete: :delete_all), null: false
      add :author_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
