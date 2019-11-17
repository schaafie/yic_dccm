defmodule YicDccmWeb.Api.ContentTypeView do
  use YicDccmWeb, :view
  alias YicDccmWeb.Api.ContentTypeView

  def render("index.json", %{contenttypes: contenttypes}) do
    %{data: render_many(contenttypes, ContentTypeView, "content_type.json")}
  end

  def render("show.json", %{content_type: content_type}) do
    %{data: render_one(content_type, ContentTypeView, "content_type.json")}
  end

  def render("content_type.json", %{content_type: content_type}) do
    %{id: content_type.id,
      name: content_type.name,
      definition: content_type.definition,
      combined_definition: content_type.combined_definition,
      instantiable: content_type.instantiable}
  end

end
