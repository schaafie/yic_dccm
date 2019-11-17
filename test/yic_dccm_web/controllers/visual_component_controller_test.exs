defmodule YicDccmWeb.VisualComponentControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{definition: %{}, description: "some description", instantiable: true, name: "some name"}
  @update_attrs %{definition: %{}, description: "some updated description", instantiable: false, name: "some updated name"}
  @invalid_attrs %{definition: nil, description: nil, instantiable: nil, name: nil}

  def fixture(:visual_component) do
    {:ok, visual_component} = SiteManager.create_visual_component(@create_attrs)
    visual_component
  end

  describe "index" do
    test "lists all visualcomponents", %{conn: conn} do
      conn = get(conn, Routes.visual_component_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visualcomponents"
    end
  end

  describe "new visual_component" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visual_component_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visual component"
    end
  end

  describe "create visual_component" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visual_component_path(conn, :create), visual_component: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visual_component_path(conn, :show, id)

      conn = get(conn, Routes.visual_component_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visual component"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visual_component_path(conn, :create), visual_component: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visual component"
    end
  end

  describe "edit visual_component" do
    setup [:create_visual_component]

    test "renders form for editing chosen visual_component", %{conn: conn, visual_component: visual_component} do
      conn = get(conn, Routes.visual_component_path(conn, :edit, visual_component))
      assert html_response(conn, 200) =~ "Edit Visual component"
    end
  end

  describe "update visual_component" do
    setup [:create_visual_component]

    test "redirects when data is valid", %{conn: conn, visual_component: visual_component} do
      conn = put(conn, Routes.visual_component_path(conn, :update, visual_component), visual_component: @update_attrs)
      assert redirected_to(conn) == Routes.visual_component_path(conn, :show, visual_component)

      conn = get(conn, Routes.visual_component_path(conn, :show, visual_component))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, visual_component: visual_component} do
      conn = put(conn, Routes.visual_component_path(conn, :update, visual_component), visual_component: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Visual component"
    end
  end

  describe "delete visual_component" do
    setup [:create_visual_component]

    test "deletes chosen visual_component", %{conn: conn, visual_component: visual_component} do
      conn = delete(conn, Routes.visual_component_path(conn, :delete, visual_component))
      assert redirected_to(conn) == Routes.visual_component_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.visual_component_path(conn, :show, visual_component))
      end
    end
  end

  defp create_visual_component(_) do
    visual_component = fixture(:visual_component)
    {:ok, visual_component: visual_component}
  end
end
