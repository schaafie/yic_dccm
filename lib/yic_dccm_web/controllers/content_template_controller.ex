defmodule YicDccmWeb.ContentTemplateController do
  use YicDccmWeb, :controller

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentTemplate

  def index(conn, _params) do
    contenttemplates = ContentManager.list_contenttemplates()
    render(conn, "index.html", contenttemplates: contenttemplates)
  end

  def new(conn, _params) do
    changeset = ContentManager.change_content_template(%ContentTemplate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"content_template" => content_template_params}) do
    case ContentManager.create_content_template(content_template_params) do
      {:ok, content_template} ->
        conn
        |> put_flash(:info, "Content template created successfully.")
        |> redirect(to: Routes.content_template_path(conn, :show, content_template))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_template = ContentManager.get_content_template!(id)
    render(conn, "show.html", content_template: content_template)
  end

  def edit(conn, %{"id" => id}) do
    content_template = ContentManager.get_content_template!(id)
    changeset = ContentManager.change_content_template(content_template)
    render(conn, "edit.html", content_template: content_template, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_template" => content_template_params}) do
    content_template = ContentManager.get_content_template!(id)

    case ContentManager.update_content_template(content_template, content_template_params) do
      {:ok, content_template} ->
        conn
        |> put_flash(:info, "Content template updated successfully.")
        |> redirect(to: Routes.content_template_path(conn, :show, content_template))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content_template: content_template, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_template = ContentManager.get_content_template!(id)
    {:ok, _content_template} = ContentManager.delete_content_template(content_template)

    conn
    |> put_flash(:info, "Content template deleted successfully.")
    |> redirect(to: Routes.content_template_path(conn, :index))
  end
end
