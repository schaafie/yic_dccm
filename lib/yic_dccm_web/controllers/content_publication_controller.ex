defmodule YicDccmWeb.ContentPublicationController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentPublication

  def index(conn, _params) do
    contentpublications = ContentManager.list_contentpublications()
    render(conn, "index.html", contentpublications: contentpublications)
  end

  def new(conn, _params) do
    changeset = ContentManager.change_content_publication(%ContentPublication{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"content_publication" => content_publication_params}) do
    case ContentManager.create_content_publication(content_publication_params) do
      {:ok, content_publication} ->
        conn
        |> put_flash(:info, "Content publication created successfully.")
        |> redirect(to: Routes.content_publication_path(conn, :show, content_publication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_publication = ContentManager.get_content_publication!(id)
    render(conn, "show.html", content_publication: content_publication)
  end

  def edit(conn, %{"id" => id}) do
    content_publication = ContentManager.get_content_publication!(id)
    changeset = ContentManager.change_content_publication(content_publication)
    render(conn, "edit.html", content_publication: content_publication, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_publication" => content_publication_params}) do
    content_publication = ContentManager.get_content_publication!(id)

    case ContentManager.update_content_publication(content_publication, content_publication_params) do
      {:ok, content_publication} ->
        conn
        |> put_flash(:info, "Content publication updated successfully.")
        |> redirect(to: Routes.content_publication_path(conn, :show, content_publication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content_publication: content_publication, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_publication = ContentManager.get_content_publication!(id)
    {:ok, _content_publication} = ContentManager.delete_content_publication(content_publication)

    conn
    |> put_flash(:info, "Content publication deleted successfully.")
    |> redirect(to: Routes.content_publication_path(conn, :index))
  end
end
