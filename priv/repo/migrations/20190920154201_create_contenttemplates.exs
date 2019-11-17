defmodule YicDccm.Repo.Migrations.CreateContenttemplates do
  use Ecto.Migration

  def change do
    create table(:contenttemplates) do
      add :name, :string
      add :description, :string
      add :definition, :map

      timestamps()
    end

  end
end
