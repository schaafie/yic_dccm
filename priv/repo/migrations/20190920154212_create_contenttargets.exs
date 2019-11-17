defmodule YicDccm.Repo.Migrations.CreateContenttargets do
  use Ecto.Migration

  def change do
    create table(:contenttargets) do
      add :name, :string
      add :description, :string
      add :method, :string
      add :target_url, :string
      add :credentials, :string
      add :version, :string

      timestamps()
    end

  end
end
