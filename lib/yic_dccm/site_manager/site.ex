defmodule YicDccm.SiteManager.Site do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sites" do
    field :description, :string
    field :metadata, {:array, :string}
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(site, attrs) do
    site
    |> cast(attrs, [:name, :description, :metadata])
    |> validate_required([:name, :description, :metadata])
  end
end
