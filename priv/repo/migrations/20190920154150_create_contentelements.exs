defmodule YicDccm.Repo.Migrations.CreateContentelements do
  use Ecto.Migration

  def change do
    create table(:contentelements) do
      add :name, :string
      add :description, :string
      add :data, :map
      add :type_id, references(:contenttypes, on_delete: :nothing)
      add :author, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:contentelements, [:type_id])
    create index(:contentelements, [:author])
  end
end
