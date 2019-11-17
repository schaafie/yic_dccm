defmodule YicDccmWeb.PageLayoutControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{creation_datetime: "2010-04-17T14:00:00Z", data: "some data", name: "some name"}
  @update_attrs %{creation_datetime: "2011-05-18T15:01:01Z", data: "some updated data", name: "some updated name"}
  @invalid_attrs %{creation_datetime: nil, data: nil, name: nil}

  def fixture(:page_layout) do
    {:ok, page_layout} = SiteManager.create_page_layout(@create_attrs)
    page_layout
  end

  describe "index" do
    test "lists all pagelayouts", %{conn: conn} do
      conn = get(conn, Routes.page_layout_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pagelayouts"
    end
  end

  describe "new page_layout" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.page_layout_path(conn, :new))
      assert html_response(conn, 200) =~ "New Page layout"
    end
  end

  describe "create page_layout" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.page_layout_path(conn, :create), page_layout: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.page_layout_path(conn, :show, id)

      conn = get(conn, Routes.page_layout_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Page layout"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.page_layout_path(conn, :create), page_layout: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Page layout"
    end
  end

  describe "edit page_layout" do
    setup [:create_page_layout]

    test "renders form for editing chosen page_layout", %{conn: conn, page_layout: page_layout} do
      conn = get(conn, Routes.page_layout_path(conn, :edit, page_layout))
      assert html_response(conn, 200) =~ "Edit Page layout"
    end
  end

  describe "update page_layout" do
    setup [:create_page_layout]

    test "redirects when data is valid", %{conn: conn, page_layout: page_layout} do
      conn = put(conn, Routes.page_layout_path(conn, :update, page_layout), page_layout: @update_attrs)
      assert redirected_to(conn) == Routes.page_layout_path(conn, :show, page_layout)

      conn = get(conn, Routes.page_layout_path(conn, :show, page_layout))
      assert html_response(conn, 200) =~ "some updated data"
    end

    test "renders errors when data is invalid", %{conn: conn, page_layout: page_layout} do
      conn = put(conn, Routes.page_layout_path(conn, :update, page_layout), page_layout: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Page layout"
    end
  end

  describe "delete page_layout" do
    setup [:create_page_layout]

    test "deletes chosen page_layout", %{conn: conn, page_layout: page_layout} do
      conn = delete(conn, Routes.page_layout_path(conn, :delete, page_layout))
      assert redirected_to(conn) == Routes.page_layout_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.page_layout_path(conn, :show, page_layout))
      end
    end
  end

  defp create_page_layout(_) do
    page_layout = fixture(:page_layout)
    {:ok, page_layout: page_layout}
  end
end
