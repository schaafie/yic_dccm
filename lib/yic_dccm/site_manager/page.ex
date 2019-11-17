defmodule YicDccm.SiteManager.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do
    field :body, :string
    field :footer, :string
    field :header, :string
    field :location, :string
    field :title, :string
    field :site_id, :id

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :location, :header, :body, :footer])
    |> validate_required([:title, :location, :header, :body, :footer])
  end
end
