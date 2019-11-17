defmodule YicDccm.Repo.Migrations.CreateSitepublications do
  use Ecto.Migration

  def change do
    create table(:sitepublications) do
      add :publication_date, :utc_datetime
      add :up_date, :utc_datetime
      add :down_date, :utc_datetime
      add :page_id, references(:pages, on_delete: :nothing)
      add :sitetarget_id, references(:sitetargets, on_delete: :nothing)

      timestamps()
    end

    create index(:sitepublications, [:page_id])
    create index(:sitepublications, [:sitetarget_id])
  end
end
