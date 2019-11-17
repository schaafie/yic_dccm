defmodule YicDccm.SiteManager.WebSnippet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "websnippets" do
    field :data, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(web_snippet, attrs) do
    web_snippet
    |> cast(attrs, [:name, :data])
    |> validate_required([:name, :data])
  end
end
