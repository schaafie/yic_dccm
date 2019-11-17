defmodule YicDccm.Repo.Migrations.CreateSites do
  use Ecto.Migration

  def change do
    create table(:sites) do
      add :name, :string
      add :description, :string
      add :metadata, {:array, :string}

      timestamps()
    end

  end
end
