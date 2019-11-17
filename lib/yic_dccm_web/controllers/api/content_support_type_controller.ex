defmodule YicDccmWeb.Api.ContentSupportTypeController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager

  action_fallback YicDccmWeb.FallbackController

  def index(conn, _params) do
    contenttypes = ContentManager.list_contenttypes()
    contentbasetypes = ContentManager.list_contentbasetypes()
    render(conn, "index.json", list: contenttypes ++ contentbasetypes)
  end

end
