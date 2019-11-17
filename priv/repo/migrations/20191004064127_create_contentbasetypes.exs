defmodule YicDccm.Repo.Migrations.CreateContentbasetypes do
  use Ecto.Migration

  def change do
    create table(:contentbasetypes) do
      add :name, :string
      add :handler, :string
      add :format, :string
      add :validations, :string

      timestamps()
    end

  end
end
