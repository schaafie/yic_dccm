defmodule YicDccm.SiteManager.SiteTarget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sitetargets" do
    field :credentials, :string
    field :description, :string
    field :method, :string
    field :name, :string
    field :target_url, :string

    timestamps()
  end

  @doc false
  def changeset(site_target, attrs) do
    site_target
    |> cast(attrs, [:name, :description, :method, :target_url, :credentials])
    |> validate_required([:name, :description, :method, :target_url, :credentials])
  end
end
