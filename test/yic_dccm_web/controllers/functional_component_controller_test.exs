defmodule YicDccmWeb.FunctionalComponentControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{definition: %{}, description: "some description", instantiable: true, name: "some name"}
  @update_attrs %{definition: %{}, description: "some updated description", instantiable: false, name: "some updated name"}
  @invalid_attrs %{definition: nil, description: nil, instantiable: nil, name: nil}

  def fixture(:functional_component) do
    {:ok, functional_component} = SiteManager.create_functional_component(@create_attrs)
    functional_component
  end

  describe "index" do
    test "lists all functionalcomponents", %{conn: conn} do
      conn = get(conn, Routes.functional_component_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Functionalcomponents"
    end
  end

  describe "new functional_component" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.functional_component_path(conn, :new))
      assert html_response(conn, 200) =~ "New Functional component"
    end
  end

  describe "create functional_component" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.functional_component_path(conn, :create), functional_component: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.functional_component_path(conn, :show, id)

      conn = get(conn, Routes.functional_component_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Functional component"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.functional_component_path(conn, :create), functional_component: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Functional component"
    end
  end

  describe "edit functional_component" do
    setup [:create_functional_component]

    test "renders form for editing chosen functional_component", %{conn: conn, functional_component: functional_component} do
      conn = get(conn, Routes.functional_component_path(conn, :edit, functional_component))
      assert html_response(conn, 200) =~ "Edit Functional component"
    end
  end

  describe "update functional_component" do
    setup [:create_functional_component]

    test "redirects when data is valid", %{conn: conn, functional_component: functional_component} do
      conn = put(conn, Routes.functional_component_path(conn, :update, functional_component), functional_component: @update_attrs)
      assert redirected_to(conn) == Routes.functional_component_path(conn, :show, functional_component)

      conn = get(conn, Routes.functional_component_path(conn, :show, functional_component))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, functional_component: functional_component} do
      conn = put(conn, Routes.functional_component_path(conn, :update, functional_component), functional_component: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Functional component"
    end
  end

  describe "delete functional_component" do
    setup [:create_functional_component]

    test "deletes chosen functional_component", %{conn: conn, functional_component: functional_component} do
      conn = delete(conn, Routes.functional_component_path(conn, :delete, functional_component))
      assert redirected_to(conn) == Routes.functional_component_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.functional_component_path(conn, :show, functional_component))
      end
    end
  end

  defp create_functional_component(_) do
    functional_component = fixture(:functional_component)
    {:ok, functional_component: functional_component}
  end
end
