defmodule YicDccm.SiteManager.VisualComponent do
  use Ecto.Schema
  import Ecto.Changeset
  alias YicDccm.Json

  schema "visualcomponents" do
    field :definition, Json
    field :description, :string
    field :instantiable, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(visual_component, attrs) do
    visual_component
    |> cast(attrs, [:name, :description, :definition, :instantiable])
    |> validate_required([:name, :description, :definition, :instantiable])
  end
end
