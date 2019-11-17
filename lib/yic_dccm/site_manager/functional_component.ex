defmodule YicDccm.SiteManager.FunctionalComponent do
  use Ecto.Schema
  import Ecto.Changeset
  alias YicDccm.Json

  schema "functionalcomponents" do
    field :definition, Json
    field :description, :string
    field :instantiable, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(functional_component, attrs) do
    functional_component
    |> cast(attrs, [:name, :description, :definition, :instantiable])
    |> validate_required([:name, :description, :definition, :instantiable])
  end
end
