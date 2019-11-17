defmodule YicDccm.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :title, :string
      add :location, :string
      add :header, :text
      add :body, :text
      add :footer, :text
      add :site_id, references(:sites, on_delete: :nothing)

      timestamps()
    end

    create index(:pages, [:site_id])
  end
end
