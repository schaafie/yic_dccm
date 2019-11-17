defmodule YicDccm.Repo.Migrations.CreateSitetargets do
  use Ecto.Migration

  def change do
    create table(:sitetargets) do
      add :name, :string
      add :description, :string
      add :method, :string
      add :target_url, :string
      add :credentials, :string

      timestamps()
    end

  end
end
