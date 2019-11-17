defmodule YicDccm.SiteManager.SitePublication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sitepublications" do
    field :down_date, :utc_datetime
    field :publication_date, :utc_datetime
    field :up_date, :utc_datetime
    field :page_id, :id
    field :sitetarget_id, :id

    timestamps()
  end

  @doc false
  def changeset(site_publication, attrs) do
    site_publication
    |> cast(attrs, [:publication_date, :up_date, :down_date])
    |> validate_required([:publication_date, :up_date, :down_date])
  end
end
