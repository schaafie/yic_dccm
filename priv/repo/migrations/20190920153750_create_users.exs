defmodule YicDccm.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :login, :string
      add :password_hash, :string
      add :email, :string
      add :status, :string
      add :first_name, :string
      add :last_name, :string
      add :infix, :string

      timestamps()
    end

    create unique_index(:users, [:login])
  end
end
