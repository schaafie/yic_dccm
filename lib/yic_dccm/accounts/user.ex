defmodule YicDccm.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :infix, :string
    field :last_name, :string
    field :login, :string
    field :password_hash, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:login, :password_hash, :email, :status, :first_name, :last_name, :infix])
    |> validate_required([:login, :password_hash, :email, :status, :first_name, :last_name, :infix])
    |> unique_constraint(:login)
  end
end
