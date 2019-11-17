defmodule YicDccmWeb.Api.ContentSupportTypeView do
  use YicDccmWeb, :view
  alias YicDccmWeb.Api.ContentSupportTypeView

  def render("index.json", %{list: contenttypes}) do
    %{data: render_many(contenttypes, ContentSupportTypeView, "content_supporttype.json")}
  end

  def render("content_supporttype.json", %{content_support_type: content_type}) do
    case content_type.__struct__ do
      YicDccm.ContentManager.ContentBasetype ->
        %{ name: content_type.name, type: "base" }
      YicDccm.ContentManager.ContentType ->
        %{ name: content_type.name, type: "complex" }
    end
  end

end
