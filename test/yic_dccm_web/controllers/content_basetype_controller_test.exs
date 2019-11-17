defmodule YicDccmWeb.ContentBasetypeControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.ContentManager

  @create_attrs %{format: "some format", handler: "some handler", name: "some name", validations: "some validations"}
  @update_attrs %{format: "some updated format", handler: "some updated handler", name: "some updated name", validations: "some updated validations"}
  @invalid_attrs %{format: nil, handler: nil, name: nil, validations: nil}

  def fixture(:content_basetype) do
    {:ok, content_basetype} = ContentManager.create_content_basetype(@create_attrs)
    content_basetype
  end

  describe "index" do
    test "lists all contentbasetypes", %{conn: conn} do
      conn = get(conn, Routes.content_basetype_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contentbasetypes"
    end
  end

  describe "new content_basetype" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.content_basetype_path(conn, :new))
      assert html_response(conn, 200) =~ "New Content basetype"
    end
  end

  describe "create content_basetype" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.content_basetype_path(conn, :create), content_basetype: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.content_basetype_path(conn, :show, id)

      conn = get(conn, Routes.content_basetype_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Content basetype"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.content_basetype_path(conn, :create), content_basetype: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content basetype"
    end
  end

  describe "edit content_basetype" do
    setup [:create_content_basetype]

    test "renders form for editing chosen content_basetype", %{conn: conn, content_basetype: content_basetype} do
      conn = get(conn, Routes.content_basetype_path(conn, :edit, content_basetype))
      assert html_response(conn, 200) =~ "Edit Content basetype"
    end
  end

  describe "update content_basetype" do
    setup [:create_content_basetype]

    test "redirects when data is valid", %{conn: conn, content_basetype: content_basetype} do
      conn = put(conn, Routes.content_basetype_path(conn, :update, content_basetype), content_basetype: @update_attrs)
      assert redirected_to(conn) == Routes.content_basetype_path(conn, :show, content_basetype)

      conn = get(conn, Routes.content_basetype_path(conn, :show, content_basetype))
      assert html_response(conn, 200) =~ "some updated format"
    end

    test "renders errors when data is invalid", %{conn: conn, content_basetype: content_basetype} do
      conn = put(conn, Routes.content_basetype_path(conn, :update, content_basetype), content_basetype: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content basetype"
    end
  end

  describe "delete content_basetype" do
    setup [:create_content_basetype]

    test "deletes chosen content_basetype", %{conn: conn, content_basetype: content_basetype} do
      conn = delete(conn, Routes.content_basetype_path(conn, :delete, content_basetype))
      assert redirected_to(conn) == Routes.content_basetype_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.content_basetype_path(conn, :show, content_basetype))
      end
    end
  end

  defp create_content_basetype(_) do
    content_basetype = fixture(:content_basetype)
    {:ok, content_basetype: content_basetype}
  end
end
