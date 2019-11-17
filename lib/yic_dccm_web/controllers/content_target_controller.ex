defmodule YicDccmWeb.ContentTargetController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentTarget

  def index(conn, _params) do
    contenttargets = ContentManager.list_contenttargets()
    render(conn, "index.html", contenttargets: contenttargets)
  end

  def new(conn, _params) do
    changeset = ContentManager.change_content_target(%ContentTarget{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"content_target" => content_target_params}) do
    case ContentManager.create_content_target(content_target_params) do
      {:ok, content_target} ->
        conn
        |> put_flash(:info, "Content target created successfully.")
        |> redirect(to: Routes.content_target_path(conn, :show, content_target))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_target = ContentManager.get_content_target!(id)
    render(conn, "show.html", content_target: content_target)
  end

  def edit(conn, %{"id" => id}) do
    content_target = ContentManager.get_content_target!(id)
    changeset = ContentManager.change_content_target(content_target)
    render(conn, "edit.html", content_target: content_target, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_target" => content_target_params}) do
    content_target = ContentManager.get_content_target!(id)

    case ContentManager.update_content_target(content_target, content_target_params) do
      {:ok, content_target} ->
        conn
        |> put_flash(:info, "Content target updated successfully.")
        |> redirect(to: Routes.content_target_path(conn, :show, content_target))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content_target: content_target, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_target = ContentManager.get_content_target!(id)
    {:ok, _content_target} = ContentManager.delete_content_target(content_target)

    conn
    |> put_flash(:info, "Content target deleted successfully.")
    |> redirect(to: Routes.content_target_path(conn, :index))
  end
end
