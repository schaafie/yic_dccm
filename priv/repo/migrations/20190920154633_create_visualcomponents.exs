defmodule YicDccm.Repo.Migrations.CreateVisualcomponents do
  use Ecto.Migration

  def change do
    create table(:visualcomponents) do
      add :name, :string
      add :description, :string
      add :definition, :map
      add :instantiable, :boolean, default: false, null: false

      timestamps()
    end

  end
end
