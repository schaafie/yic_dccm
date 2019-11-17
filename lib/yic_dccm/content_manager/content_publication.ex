defmodule YicDccm.ContentManager.ContentPublication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contentpublications" do
    field :down_date, :utc_datetime
    field :publication_date, :utc_datetime
    field :up_date, :utc_datetime
    field :contentelement_id, :id
    field :contenttemplate_id, :id
    field :contenttarget_id, :id

    timestamps()
  end

  @doc false
  def changeset(content_publication, attrs) do
    content_publication
    |> cast(attrs, [:publication_date, :up_date, :down_date])
    |> validate_required([:publication_date, :up_date, :down_date])
  end
end
