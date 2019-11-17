defmodule YicDccm.ContentManager.ContentTarget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contenttargets" do
    field :credentials, :string
    field :description, :string
    field :method, :string
    field :name, :string
    field :target_url, :string
    field :version, :string

    timestamps()
  end

  @doc false
  def changeset(content_target, attrs) do
    content_target
    |> cast(attrs, [:name, :description, :method, :target_url, :credentials, :version])
    |> validate_required([:name, :description, :method, :target_url, :credentials, :version])
  end
end
