defmodule YicDccm.Repo.Migrations.CreateFunctionalcomponents do
  use Ecto.Migration

  def change do
    create table(:functionalcomponents) do
      add :name, :string
      add :description, :string
      add :definition, :map
      add :instantiable, :boolean, default: false, null: false

      timestamps()
    end

  end
end
