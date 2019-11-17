defmodule YicDccm.Repo.Migrations.CreatePagelayouts do
  use Ecto.Migration

  def change do
    create table(:pagelayouts) do
      add :name, :string
      add :data, :text
      timestamps()
    end

  end
end
