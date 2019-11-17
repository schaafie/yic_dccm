defmodule YicDccmWeb.PageTemplateControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{creation_datetime: "2010-04-17T14:00:00Z", data: "some data", name: "some name"}
  @update_attrs %{creation_datetime: "2011-05-18T15:01:01Z", data: "some updated data", name: "some updated name"}
  @invalid_attrs %{creation_datetime: nil, data: nil, name: nil}

  def fixture(:page_template) do
    {:ok, page_template} = SiteManager.create_page_template(@create_attrs)
    page_template
  end

  describe "index" do
    test "lists all pagetemplates", %{conn: conn} do
      conn = get(conn, Routes.page_template_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pagetemplates"
    end
  end

  describe "new page_template" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.page_template_path(conn, :new))
      assert html_response(conn, 200) =~ "New Page template"
    end
  end

  describe "create page_template" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.page_template_path(conn, :create), page_template: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.page_template_path(conn, :show, id)

      conn = get(conn, Routes.page_template_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Page template"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.page_template_path(conn, :create), page_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Page template"
    end
  end

  describe "edit page_template" do
    setup [:create_page_template]

    test "renders form for editing chosen page_template", %{conn: conn, page_template: page_template} do
      conn = get(conn, Routes.page_template_path(conn, :edit, page_template))
      assert html_response(conn, 200) =~ "Edit Page template"
    end
  end

  describe "update page_template" do
    setup [:create_page_template]

    test "redirects when data is valid", %{conn: conn, page_template: page_template} do
      conn = put(conn, Routes.page_template_path(conn, :update, page_template), page_template: @update_attrs)
      assert redirected_to(conn) == Routes.page_template_path(conn, :show, page_template)

      conn = get(conn, Routes.page_template_path(conn, :show, page_template))
      assert html_response(conn, 200) =~ "some updated data"
    end

    test "renders errors when data is invalid", %{conn: conn, page_template: page_template} do
      conn = put(conn, Routes.page_template_path(conn, :update, page_template), page_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Page template"
    end
  end

  describe "delete page_template" do
    setup [:create_page_template]

    test "deletes chosen page_template", %{conn: conn, page_template: page_template} do
      conn = delete(conn, Routes.page_template_path(conn, :delete, page_template))
      assert redirected_to(conn) == Routes.page_template_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.page_template_path(conn, :show, page_template))
      end
    end
  end

  defp create_page_template(_) do
    page_template = fixture(:page_template)
    {:ok, page_template: page_template}
  end
end
