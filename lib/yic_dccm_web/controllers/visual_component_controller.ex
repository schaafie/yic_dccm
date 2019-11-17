defmodule YicDccmWeb.VisualComponentController do
  use YicDccmWeb, :controller

  alias YicDccm.SiteManager
  alias YicDccm.SiteManager.VisualComponent

  def index(conn, _params) do
    visualcomponents = SiteManager.list_visualcomponents()
    render(conn, "index.html", visualcomponents: visualcomponents)
  end

  def new(conn, _params) do
    changeset = SiteManager.change_visual_component(%VisualComponent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visual_component" => visual_component_params}) do
    case SiteManager.create_visual_component(visual_component_params) do
      {:ok, visual_component} ->
        conn
        |> put_flash(:info, "Visual component created successfully.")
        |> redirect(to: Routes.visual_component_path(conn, :show, visual_component))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visual_component = SiteManager.get_visual_component!(id)
    render(conn, "show.html", visual_component: visual_component)
  end

  def edit(conn, %{"id" => id}) do
    visual_component = SiteManager.get_visual_component!(id)
    changeset = SiteManager.change_visual_component(visual_component)
    render(conn, "edit.html", visual_component: visual_component, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visual_component" => visual_component_params}) do
    visual_component = SiteManager.get_visual_component!(id)

    case SiteManager.update_visual_component(visual_component, visual_component_params) do
      {:ok, visual_component} ->
        conn
        |> put_flash(:info, "Visual component updated successfully.")
        |> redirect(to: Routes.visual_component_path(conn, :show, visual_component))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visual_component: visual_component, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visual_component = SiteManager.get_visual_component!(id)
    {:ok, _visual_component} = SiteManager.delete_visual_component(visual_component)

    conn
    |> put_flash(:info, "Visual component deleted successfully.")
    |> redirect(to: Routes.visual_component_path(conn, :index))
  end
end
