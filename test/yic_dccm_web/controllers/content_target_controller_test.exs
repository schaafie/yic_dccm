defmodule YicDccmWeb.ContentTargetControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.ContentManager

  @create_attrs %{credentials: "some credentials", description: "some description", method: "some method", name: "some name", target_url: "some target_url", version: "some version"}
  @update_attrs %{credentials: "some updated credentials", description: "some updated description", method: "some updated method", name: "some updated name", target_url: "some updated target_url", version: "some updated version"}
  @invalid_attrs %{credentials: nil, description: nil, method: nil, name: nil, target_url: nil, version: nil}

  def fixture(:content_target) do
    {:ok, content_target} = ContentManager.create_content_target(@create_attrs)
    content_target
  end

  describe "index" do
    test "lists all contenttargets", %{conn: conn} do
      conn = get(conn, Routes.content_target_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contenttargets"
    end
  end

  describe "new content_target" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.content_target_path(conn, :new))
      assert html_response(conn, 200) =~ "New Content target"
    end
  end

  describe "create content_target" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.content_target_path(conn, :create), content_target: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.content_target_path(conn, :show, id)

      conn = get(conn, Routes.content_target_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Content target"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.content_target_path(conn, :create), content_target: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content target"
    end
  end

  describe "edit content_target" do
    setup [:create_content_target]

    test "renders form for editing chosen content_target", %{conn: conn, content_target: content_target} do
      conn = get(conn, Routes.content_target_path(conn, :edit, content_target))
      assert html_response(conn, 200) =~ "Edit Content target"
    end
  end

  describe "update content_target" do
    setup [:create_content_target]

    test "redirects when data is valid", %{conn: conn, content_target: content_target} do
      conn = put(conn, Routes.content_target_path(conn, :update, content_target), content_target: @update_attrs)
      assert redirected_to(conn) == Routes.content_target_path(conn, :show, content_target)

      conn = get(conn, Routes.content_target_path(conn, :show, content_target))
      assert html_response(conn, 200) =~ "some updated credentials"
    end

    test "renders errors when data is invalid", %{conn: conn, content_target: content_target} do
      conn = put(conn, Routes.content_target_path(conn, :update, content_target), content_target: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content target"
    end
  end

  describe "delete content_target" do
    setup [:create_content_target]

    test "deletes chosen content_target", %{conn: conn, content_target: content_target} do
      conn = delete(conn, Routes.content_target_path(conn, :delete, content_target))
      assert redirected_to(conn) == Routes.content_target_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.content_target_path(conn, :show, content_target))
      end
    end
  end

  defp create_content_target(_) do
    content_target = fixture(:content_target)
    {:ok, content_target: content_target}
  end
end
