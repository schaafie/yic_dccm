defmodule YicDccm.SiteManager.PageLayout do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pagelayouts" do
    field :data, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(page_layout, attrs) do
    page_layout
    |> cast(attrs, [:name, :data])
    |> validate_required([:name, :data])
  end
end
