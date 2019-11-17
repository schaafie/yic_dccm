defmodule YicDccm.Repo.Migrations.CreateWebsnippets do
  use Ecto.Migration

  def change do
    create table(:websnippets) do
      add :name, :string
      add :data, :text

      timestamps()
    end

  end
end
