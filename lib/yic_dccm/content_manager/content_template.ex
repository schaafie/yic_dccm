defmodule YicDccm.ContentManager.ContentTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contenttemplates" do
    field :definition, :map
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(content_template, attrs) do
    content_template
    |> cast(attrs, [:name, :description, :definition])
    |> validate_required([:name, :description, :definition])
  end
end
