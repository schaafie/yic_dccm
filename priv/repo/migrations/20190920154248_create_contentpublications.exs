defmodule YicDccm.Repo.Migrations.CreateContentpublications do
  use Ecto.Migration

  def change do
    create table(:contentpublications) do
      add :publication_date, :utc_datetime
      add :up_date, :utc_datetime
      add :down_date, :utc_datetime
      add :contentelement_id, references(:contentelements, on_delete: :nothing)
      add :contenttemplate_id, references(:contenttemplates, on_delete: :nothing)
      add :contenttarget_id, references(:contenttargets, on_delete: :nothing)

      timestamps()
    end

    create index(:contentpublications, [:contentelement_id])
    create index(:contentpublications, [:contenttemplate_id])
    create index(:contentpublications, [:contenttarget_id])
  end
end
