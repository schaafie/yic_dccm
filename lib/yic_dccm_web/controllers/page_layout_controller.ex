defmodule YicDccmWeb.PageLayoutController do
  use YicDccmWeb, :controller

  alias YicDccm.SiteManager
  alias YicDccm.SiteManager.PageLayout

  def index(conn, _params) do
    pagelayouts = SiteManager.list_pagelayouts()
    render(conn, "index.html", pagelayouts: pagelayouts)
  end

  def new(conn, _params) do
    changeset = SiteManager.change_page_layout(%PageLayout{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"page_layout" => page_layout_params}) do
    case SiteManager.create_page_layout(page_layout_params) do
      {:ok, page_layout} ->
        conn
        |> put_flash(:info, "Page layout created successfully.")
        |> redirect(to: Routes.page_layout_path(conn, :show, page_layout))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    page_layout = SiteManager.get_page_layout!(id)
    render(conn, "show.html", page_layout: page_layout)
  end

  def edit(conn, %{"id" => id}) do
    page_layout = SiteManager.get_page_layout!(id)
    changeset = SiteManager.change_page_layout(page_layout)
    render(conn, "edit.html", page_layout: page_layout, changeset: changeset)
  end

  def update(conn, %{"id" => id, "page_layout" => page_layout_params}) do
    page_layout = SiteManager.get_page_layout!(id)

    case SiteManager.update_page_layout(page_layout, page_layout_params) do
      {:ok, page_layout} ->
        conn
        |> put_flash(:info, "Page layout updated successfully.")
        |> redirect(to: Routes.page_layout_path(conn, :show, page_layout))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", page_layout: page_layout, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    page_layout = SiteManager.get_page_layout!(id)
    {:ok, _page_layout} = SiteManager.delete_page_layout(page_layout)

    conn
    |> put_flash(:info, "Page layout deleted successfully.")
    |> redirect(to: Routes.page_layout_path(conn, :index))
  end
end
