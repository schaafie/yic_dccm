defmodule YicDccmWeb.WebSnippetController do
  use YicDccmWeb, :controller

  alias YicDccm.SiteManager
  alias YicDccm.SiteManager.WebSnippet

  def index(conn, _params) do
    websnippets = SiteManager.list_websnippets()
    render(conn, "index.html", websnippets: websnippets)
  end

  def new(conn, _params) do
    changeset = SiteManager.change_web_snippet(%WebSnippet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"web_snippet" => web_snippet_params}) do
    case SiteManager.create_web_snippet(web_snippet_params) do
      {:ok, web_snippet} ->
        conn
        |> put_flash(:info, "Web snippet created successfully.")
        |> redirect(to: Routes.web_snippet_path(conn, :show, web_snippet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    web_snippet = SiteManager.get_web_snippet!(id)
    render(conn, "show.html", web_snippet: web_snippet)
  end

  def edit(conn, %{"id" => id}) do
    web_snippet = SiteManager.get_web_snippet!(id)
    changeset = SiteManager.change_web_snippet(web_snippet)
    render(conn, "edit.html", web_snippet: web_snippet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "web_snippet" => web_snippet_params}) do
    web_snippet = SiteManager.get_web_snippet!(id)

    case SiteManager.update_web_snippet(web_snippet, web_snippet_params) do
      {:ok, web_snippet} ->
        conn
        |> put_flash(:info, "Web snippet updated successfully.")
        |> redirect(to: Routes.web_snippet_path(conn, :show, web_snippet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", web_snippet: web_snippet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    web_snippet = SiteManager.get_web_snippet!(id)
    {:ok, _web_snippet} = SiteManager.delete_web_snippet(web_snippet)

    conn
    |> put_flash(:info, "Web snippet deleted successfully.")
    |> redirect(to: Routes.web_snippet_path(conn, :index))
  end
end
