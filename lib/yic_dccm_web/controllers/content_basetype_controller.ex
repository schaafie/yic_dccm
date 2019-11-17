defmodule YicDccmWeb.ContentBasetypeController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentBasetype

  def index(conn, _params) do
    contentbasetypes = ContentManager.list_contentbasetypes()
    render(conn, "index.html", contentbasetypes: contentbasetypes)
  end

  def new(conn, _params) do
    changeset = ContentManager.change_content_basetype(%ContentBasetype{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"content_basetype" => content_basetype_params}) do
    case ContentManager.create_content_basetype(content_basetype_params) do
      {:ok, content_basetype} ->
        conn
        |> put_flash(:info, "Content basetype created successfully.")
        |> redirect(to: Routes.content_basetype_path(conn, :show, content_basetype))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_basetype = ContentManager.get_content_basetype!(id)
    render(conn, "show.html", content_basetype: content_basetype)
  end

  def edit(conn, %{"id" => id}) do
    content_basetype = ContentManager.get_content_basetype!(id)
    changeset = ContentManager.change_content_basetype(content_basetype)
    render(conn, "edit.html", content_basetype: content_basetype, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_basetype" => content_basetype_params}) do
    content_basetype = ContentManager.get_content_basetype!(id)

    case ContentManager.update_content_basetype(content_basetype, content_basetype_params) do
      {:ok, content_basetype} ->
        conn
        |> put_flash(:info, "Content basetype updated successfully.")
        |> redirect(to: Routes.content_basetype_path(conn, :show, content_basetype))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content_basetype: content_basetype, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_basetype = ContentManager.get_content_basetype!(id)
    {:ok, _content_basetype} = ContentManager.delete_content_basetype(content_basetype)

    conn
    |> put_flash(:info, "Content basetype deleted successfully.")
    |> redirect(to: Routes.content_basetype_path(conn, :index))
  end
end
