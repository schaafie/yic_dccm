defmodule YicDccm.Repo.Migrations.CreateContenttypes do
  use Ecto.Migration

  def change do
    create table(:contenttypes) do
      add :name, :string
      add :definition, {:array, :map}, default: []
      add :combined_definition, {:array, :map}, default: []
      add :instantiable, :boolean, default: false, null: false

      timestamps()
    end

  end
end
