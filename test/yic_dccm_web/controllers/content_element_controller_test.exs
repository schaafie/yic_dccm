defmodule YicDccmWeb.ContentElementControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.ContentManager

  @create_attrs %{data: %{}, description: "some description", name: "some name"}
  @update_attrs %{data: %{}, description: "some updated description", name: "some updated name"}
  @invalid_attrs %{data: nil, description: nil, name: nil}

  def fixture(:content_element) do
    {:ok, content_element} = ContentManager.create_content_element(@create_attrs)
    content_element
  end

  describe "index" do
    test "lists all contentelements", %{conn: conn} do
      conn = get(conn, Routes.content_element_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contentelements"
    end
  end

  describe "new content_element" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.content_element_path(conn, :new))
      assert html_response(conn, 200) =~ "New Content element"
    end
  end

  describe "create content_element" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.content_element_path(conn, :create), content_element: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.content_element_path(conn, :show, id)

      conn = get(conn, Routes.content_element_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Content element"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.content_element_path(conn, :create), content_element: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content element"
    end
  end

  describe "edit content_element" do
    setup [:create_content_element]

    test "renders form for editing chosen content_element", %{conn: conn, content_element: content_element} do
      conn = get(conn, Routes.content_element_path(conn, :edit, content_element))
      assert html_response(conn, 200) =~ "Edit Content element"
    end
  end

  describe "update content_element" do
    setup [:create_content_element]

    test "redirects when data is valid", %{conn: conn, content_element: content_element} do
      conn = put(conn, Routes.content_element_path(conn, :update, content_element), content_element: @update_attrs)
      assert redirected_to(conn) == Routes.content_element_path(conn, :show, content_element)

      conn = get(conn, Routes.content_element_path(conn, :show, content_element))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, content_element: content_element} do
      conn = put(conn, Routes.content_element_path(conn, :update, content_element), content_element: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content element"
    end
  end

  describe "delete content_element" do
    setup [:create_content_element]

    test "deletes chosen content_element", %{conn: conn, content_element: content_element} do
      conn = delete(conn, Routes.content_element_path(conn, :delete, content_element))
      assert redirected_to(conn) == Routes.content_element_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.content_element_path(conn, :show, content_element))
      end
    end
  end

  defp create_content_element(_) do
    content_element = fixture(:content_element)
    {:ok, content_element: content_element}
  end
end
