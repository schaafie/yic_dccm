defmodule YicDccmWeb.FunctionalComponentController do
  use YicDccmWeb, :controller

  alias YicDccm.SiteManager
  alias YicDccm.SiteManager.FunctionalComponent

  def index(conn, _params) do
    functionalcomponents = SiteManager.list_functionalcomponents()
    render(conn, "index.html", functionalcomponents: functionalcomponents)
  end

  def new(conn, _params) do
    changeset = SiteManager.change_functional_component(%FunctionalComponent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"functional_component" => functional_component_params}) do
    case SiteManager.create_functional_component(functional_component_params) do
      {:ok, functional_component} ->
        conn
        |> put_flash(:info, "Functional component created successfully.")
        |> redirect(to: Routes.functional_component_path(conn, :show, functional_component))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    functional_component = SiteManager.get_functional_component!(id)
    render(conn, "show.html", functional_component: functional_component)
  end

  def edit(conn, %{"id" => id}) do
    functional_component = SiteManager.get_functional_component!(id)
    changeset = SiteManager.change_functional_component(functional_component)
    render(conn, "edit.html", functional_component: functional_component, changeset: changeset)
  end

  def update(conn, %{"id" => id, "functional_component" => functional_component_params}) do
    functional_component = SiteManager.get_functional_component!(id)

    case SiteManager.update_functional_component(functional_component, functional_component_params) do
      {:ok, functional_component} ->
        conn
        |> put_flash(:info, "Functional component updated successfully.")
        |> redirect(to: Routes.functional_component_path(conn, :show, functional_component))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", functional_component: functional_component, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    functional_component = SiteManager.get_functional_component!(id)
    {:ok, _functional_component} = SiteManager.delete_functional_component(functional_component)

    conn
    |> put_flash(:info, "Functional component deleted successfully.")
    |> redirect(to: Routes.functional_component_path(conn, :index))
  end
end
