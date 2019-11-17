defmodule YicDccmWeb.SiteTargetController do
  use YicDccmWeb, :controller

  alias YicDccm.SiteManager
  alias YicDccm.SiteManager.SiteTarget

  def index(conn, _params) do
    sitetargets = SiteManager.list_sitetargets()
    render(conn, "index.html", sitetargets: sitetargets)
  end

  def new(conn, _params) do
    changeset = SiteManager.change_site_target(%SiteTarget{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"site_target" => site_target_params}) do
    case SiteManager.create_site_target(site_target_params) do
      {:ok, site_target} ->
        conn
        |> put_flash(:info, "Site target created successfully.")
        |> redirect(to: Routes.site_target_path(conn, :show, site_target))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    site_target = SiteManager.get_site_target!(id)
    render(conn, "show.html", site_target: site_target)
  end

  def edit(conn, %{"id" => id}) do
    site_target = SiteManager.get_site_target!(id)
    changeset = SiteManager.change_site_target(site_target)
    render(conn, "edit.html", site_target: site_target, changeset: changeset)
  end

  def update(conn, %{"id" => id, "site_target" => site_target_params}) do
    site_target = SiteManager.get_site_target!(id)

    case SiteManager.update_site_target(site_target, site_target_params) do
      {:ok, site_target} ->
        conn
        |> put_flash(:info, "Site target updated successfully.")
        |> redirect(to: Routes.site_target_path(conn, :show, site_target))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", site_target: site_target, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    site_target = SiteManager.get_site_target!(id)
    {:ok, _site_target} = SiteManager.delete_site_target(site_target)

    conn
    |> put_flash(:info, "Site target deleted successfully.")
    |> redirect(to: Routes.site_target_path(conn, :index))
  end
end
