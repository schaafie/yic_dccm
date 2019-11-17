defmodule YicDccmWeb.SitePublicationController do
  use YicDccmWeb, :controller

  alias YicDccm.SiteManager
  alias YicDccm.SiteManager.SitePublication

  def index(conn, _params) do
    sitepublications = SiteManager.list_sitepublications()
    render(conn, "index.html", sitepublications: sitepublications)
  end

  def new(conn, _params) do
    changeset = SiteManager.change_site_publication(%SitePublication{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"site_publication" => site_publication_params}) do
    case SiteManager.create_site_publication(site_publication_params) do
      {:ok, site_publication} ->
        conn
        |> put_flash(:info, "Site publication created successfully.")
        |> redirect(to: Routes.site_publication_path(conn, :show, site_publication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    site_publication = SiteManager.get_site_publication!(id)
    render(conn, "show.html", site_publication: site_publication)
  end

  def edit(conn, %{"id" => id}) do
    site_publication = SiteManager.get_site_publication!(id)
    changeset = SiteManager.change_site_publication(site_publication)
    render(conn, "edit.html", site_publication: site_publication, changeset: changeset)
  end

  def update(conn, %{"id" => id, "site_publication" => site_publication_params}) do
    site_publication = SiteManager.get_site_publication!(id)

    case SiteManager.update_site_publication(site_publication, site_publication_params) do
      {:ok, site_publication} ->
        conn
        |> put_flash(:info, "Site publication updated successfully.")
        |> redirect(to: Routes.site_publication_path(conn, :show, site_publication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", site_publication: site_publication, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    site_publication = SiteManager.get_site_publication!(id)
    {:ok, _site_publication} = SiteManager.delete_site_publication(site_publication)

    conn
    |> put_flash(:info, "Site publication deleted successfully.")
    |> redirect(to: Routes.site_publication_path(conn, :index))
  end
end
