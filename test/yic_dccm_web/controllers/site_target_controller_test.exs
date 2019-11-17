defmodule YicDccmWeb.SiteTargetControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{credentials: "some credentials", description: "some description", method: "some method", name: "some name", target_url: "some target_url"}
  @update_attrs %{credentials: "some updated credentials", description: "some updated description", method: "some updated method", name: "some updated name", target_url: "some updated target_url"}
  @invalid_attrs %{credentials: nil, description: nil, method: nil, name: nil, target_url: nil}

  def fixture(:site_target) do
    {:ok, site_target} = SiteManager.create_site_target(@create_attrs)
    site_target
  end

  describe "index" do
    test "lists all sitetargets", %{conn: conn} do
      conn = get(conn, Routes.site_target_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sitetargets"
    end
  end

  describe "new site_target" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.site_target_path(conn, :new))
      assert html_response(conn, 200) =~ "New Site target"
    end
  end

  describe "create site_target" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.site_target_path(conn, :create), site_target: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.site_target_path(conn, :show, id)

      conn = get(conn, Routes.site_target_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Site target"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.site_target_path(conn, :create), site_target: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Site target"
    end
  end

  describe "edit site_target" do
    setup [:create_site_target]

    test "renders form for editing chosen site_target", %{conn: conn, site_target: site_target} do
      conn = get(conn, Routes.site_target_path(conn, :edit, site_target))
      assert html_response(conn, 200) =~ "Edit Site target"
    end
  end

  describe "update site_target" do
    setup [:create_site_target]

    test "redirects when data is valid", %{conn: conn, site_target: site_target} do
      conn = put(conn, Routes.site_target_path(conn, :update, site_target), site_target: @update_attrs)
      assert redirected_to(conn) == Routes.site_target_path(conn, :show, site_target)

      conn = get(conn, Routes.site_target_path(conn, :show, site_target))
      assert html_response(conn, 200) =~ "some updated credentials"
    end

    test "renders errors when data is invalid", %{conn: conn, site_target: site_target} do
      conn = put(conn, Routes.site_target_path(conn, :update, site_target), site_target: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Site target"
    end
  end

  describe "delete site_target" do
    setup [:create_site_target]

    test "deletes chosen site_target", %{conn: conn, site_target: site_target} do
      conn = delete(conn, Routes.site_target_path(conn, :delete, site_target))
      assert redirected_to(conn) == Routes.site_target_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.site_target_path(conn, :show, site_target))
      end
    end
  end

  defp create_site_target(_) do
    site_target = fixture(:site_target)
    {:ok, site_target: site_target}
  end
end
