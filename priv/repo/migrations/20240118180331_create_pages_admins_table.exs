defmodule Volko.Repo.Migrations.CreatePagesAdminsTable do
  use Ecto.Migration

  def change do
    create table(:pages_admins) do
      add :page_id, references(:pages, type: :binary_id, on_delete: :delete_all)
      add :admin_id, references(:users, type: :binary_id, on_delete: :delete_all)
    end

    create unique_index(:pages_admins, [:page_id, :admin_id])
  end
end
