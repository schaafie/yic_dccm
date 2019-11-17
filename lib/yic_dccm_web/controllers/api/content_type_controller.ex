defmodule YicDccmWeb.Api.ContentTypeController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentType

  action_fallback YicDccmWeb.FallbackController

  def index(conn, _params) do
    contenttypes = ContentManager.list_contenttypes()
    render(conn, "index.json", contenttypes: contenttypes)
  end

  def create(conn, %{"content_type" => content_type_params}) do
    with {:ok, %ContentType{} = content_type} <- ContentManager.create_content_type(content_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.content_type_path(conn, :show, content_type))
      |> render("show.json", content_type: content_type)
    end
  end

  def show(conn, %{"id" => id}) do
    content_type = ContentManager.get_content_type!(id)
    render(conn, "show.json", content_type: content_type)
  end

  def update(conn, %{"id" => id, "content_type" => content_type_params}) do
    content_type = ContentManager.get_content_type!(id)

    with {:ok, %ContentType{} = content_type} <- ContentManager.update_content_type(content_type, content_type_params) do
      render(conn, "show.json", content_type: content_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_type = ContentManager.get_content_type!(id)

    with {:ok, %ContentType{}} <- ContentManager.delete_content_type(content_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
