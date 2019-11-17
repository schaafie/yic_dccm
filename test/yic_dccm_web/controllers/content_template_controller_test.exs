defmodule YicDccmWeb.ContentTemplateControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.ContentManager

  @create_attrs %{definition: %{}, description: "some description", name: "some name"}
  @update_attrs %{definition: %{}, description: "some updated description", name: "some updated name"}
  @invalid_attrs %{definition: nil, description: nil, name: nil}

  def fixture(:content_template) do
    {:ok, content_template} = ContentManager.create_content_template(@create_attrs)
    content_template
  end

  describe "index" do
    test "lists all contenttemplates", %{conn: conn} do
      conn = get(conn, Routes.content_template_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contenttemplates"
    end
  end

  describe "new content_template" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.content_template_path(conn, :new))
      assert html_response(conn, 200) =~ "New Content template"
    end
  end

  describe "create content_template" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.content_template_path(conn, :create), content_template: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.content_template_path(conn, :show, id)

      conn = get(conn, Routes.content_template_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Content template"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.content_template_path(conn, :create), content_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content template"
    end
  end

  describe "edit content_template" do
    setup [:create_content_template]

    test "renders form for editing chosen content_template", %{conn: conn, content_template: content_template} do
      conn = get(conn, Routes.content_template_path(conn, :edit, content_template))
      assert html_response(conn, 200) =~ "Edit Content template"
    end
  end

  describe "update content_template" do
    setup [:create_content_template]

    test "redirects when data is valid", %{conn: conn, content_template: content_template} do
      conn = put(conn, Routes.content_template_path(conn, :update, content_template), content_template: @update_attrs)
      assert redirected_to(conn) == Routes.content_template_path(conn, :show, content_template)

      conn = get(conn, Routes.content_template_path(conn, :show, content_template))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, content_template: content_template} do
      conn = put(conn, Routes.content_template_path(conn, :update, content_template), content_template: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content template"
    end
  end

  describe "delete content_template" do
    setup [:create_content_template]

    test "deletes chosen content_template", %{conn: conn, content_template: content_template} do
      conn = delete(conn, Routes.content_template_path(conn, :delete, content_template))
      assert redirected_to(conn) == Routes.content_template_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.content_template_path(conn, :show, content_template))
      end
    end
  end

  defp create_content_template(_) do
    content_template = fixture(:content_template)
    {:ok, content_template: content_template}
  end
end
