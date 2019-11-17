defmodule YicDccmWeb.ContentTypeController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentType

  def index(conn, _params) do
    contenttypes = ContentManager.list_contenttypes()
    render(conn, "index.html", contenttypes: contenttypes)
  end

  def new(conn, _params) do
    changeset = ContentManager.change_content_type(%ContentType{})
    contenttypes = ContentManager.list_contenttypes()
    conn
    |> assign( :contenttypes, contenttypes )
    |> render( "new.html", changeset: changeset )
  end

  def create(conn, %{"content_type" => content_type_params}) do
    case ContentManager.create_content_type(content_type_params) do
      {:ok, content_type} ->
        conn
        |> put_flash(:info, "Content type created successfully.")
        |> redirect(to: Routes.content_type_path(conn, :show, content_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_type = ContentManager.get_content_type!(id)
    render(conn, "show.html", content_type: content_type)
  end

  def edit(conn, %{"id" => id}) do
    content_type = ContentManager.get_content_type!(id)
    changeset = ContentManager.change_content_type(content_type)
    contenttypes = ContentManager.list_contenttypes()
    conn
    |> assign( :contenttypes, contenttypes )
    |> render( "edit.html", content_type: content_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_type" => content_type_params}) do
    content_type = ContentManager.get_content_type!(id)

    case ContentManager.update_content_type(content_type, content_type_params) do
      {:ok, content_type} ->
        conn
        |> put_flash(:info, "Content type updated successfully.")
        |> redirect(to: Routes.content_type_path(conn, :show, content_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content_type: content_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_type = ContentManager.get_content_type!(id)
    {:ok, content_type} = ContentManager.delete_content_type(content_type)

    conn
    |> put_flash(:info, "Content type deleted successfully.")
    |> redirect(to: Routes.content_type_path(conn, :index))
  end
end
