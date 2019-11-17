defmodule YicDccm.ContentManager.ContentBasetype do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contentbasetypes" do
    field :format, :string
    field :handler, :string
    field :name, :string
    field :validations, :string

    timestamps()
  end

  @doc false
  def changeset(content_basetype, attrs) do
    content_basetype
    |> cast(attrs, [:name, :handler, :format, :validations])
    |> validate_required([:name, :handler])
  end
end
