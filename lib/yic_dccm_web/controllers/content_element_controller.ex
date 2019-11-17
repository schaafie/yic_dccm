defmodule YicDccmWeb.ContentElementController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentElement

  def index(conn, _params) do
    contentelements = ContentManager.list_contentelements()
    render(conn, "index.html", contentelements: contentelements)
  end

  def new(conn, _params) do
    changeset = ContentManager.change_content_element(%ContentElement{})
    contenttypes = ContentManager.list_contenttypes()
                   |> Enum.map(&{"#{&1.name}", &1.id})
    render(conn, "new.html", changeset: changeset, contenttypes: contenttypes)
  end

  def create(conn, %{"content_element" => content_element_params}) do
    case ContentManager.create_content_element(content_element_params) do
      {:ok, content_element} ->
        conn
        |> redirect(to: Routes.content_element_path(conn, :edit, content_element))
      {:error, %Ecto.Changeset{} = changeset} ->
        contenttypes = ContentManager.list_contenttypes()
                       |> Enum.map(&{"#{&1.name}", &1.id})
        render(conn, "new.html", changeset: changeset, contenttypes: contenttypes)
    end
  end

  def show(conn, %{"id" => id}) do
    content_element = ContentManager.get_content_element!(id)
    render(conn, "show.html", content_element: content_element)
  end

  def edit(conn, %{"id" => id}) do
    content_element = ContentManager.get_content_element!(id)
    changeset = ContentManager.change_content_element(content_element)
    render(conn, "edit.html", content_element: content_element, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_element" => content_element_params}) do
    content_element = ContentManager.get_content_element!(id)

    case ContentManager.update_content_element(content_element, content_element_params) do
      {:ok, content_element} ->
        conn
        |> put_flash(:info, "Content element updated successfully.")
        |> redirect(to: Routes.content_element_path(conn, :show, content_element))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content_element: content_element, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_element = ContentManager.get_content_element!(id)
    {:ok, _content_element} = ContentManager.delete_content_element(content_element)

    conn
    |> put_flash(:info, "Content element deleted successfully.")
    |> redirect(to: Routes.content_element_path(conn, :index))
  end
end
