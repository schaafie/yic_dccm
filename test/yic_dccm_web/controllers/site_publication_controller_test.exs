defmodule YicDccmWeb.SitePublicationControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{down_date: "2010-04-17T14:00:00Z", publication_date: "2010-04-17T14:00:00Z", up_date: "2010-04-17T14:00:00Z"}
  @update_attrs %{down_date: "2011-05-18T15:01:01Z", publication_date: "2011-05-18T15:01:01Z", up_date: "2011-05-18T15:01:01Z"}
  @invalid_attrs %{down_date: nil, publication_date: nil, up_date: nil}

  def fixture(:site_publication) do
    {:ok, site_publication} = SiteManager.create_site_publication(@create_attrs)
    site_publication
  end

  describe "index" do
    test "lists all sitepublications", %{conn: conn} do
      conn = get(conn, Routes.site_publication_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sitepublications"
    end
  end

  describe "new site_publication" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.site_publication_path(conn, :new))
      assert html_response(conn, 200) =~ "New Site publication"
    end
  end

  describe "create site_publication" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.site_publication_path(conn, :create), site_publication: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.site_publication_path(conn, :show, id)

      conn = get(conn, Routes.site_publication_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Site publication"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.site_publication_path(conn, :create), site_publication: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Site publication"
    end
  end

  describe "edit site_publication" do
    setup [:create_site_publication]

    test "renders form for editing chosen site_publication", %{conn: conn, site_publication: site_publication} do
      conn = get(conn, Routes.site_publication_path(conn, :edit, site_publication))
      assert html_response(conn, 200) =~ "Edit Site publication"
    end
  end

  describe "update site_publication" do
    setup [:create_site_publication]

    test "redirects when data is valid", %{conn: conn, site_publication: site_publication} do
      conn = put(conn, Routes.site_publication_path(conn, :update, site_publication), site_publication: @update_attrs)
      assert redirected_to(conn) == Routes.site_publication_path(conn, :show, site_publication)

      conn = get(conn, Routes.site_publication_path(conn, :show, site_publication))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, site_publication: site_publication} do
      conn = put(conn, Routes.site_publication_path(conn, :update, site_publication), site_publication: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Site publication"
    end
  end

  describe "delete site_publication" do
    setup [:create_site_publication]

    test "deletes chosen site_publication", %{conn: conn, site_publication: site_publication} do
      conn = delete(conn, Routes.site_publication_path(conn, :delete, site_publication))
      assert redirected_to(conn) == Routes.site_publication_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.site_publication_path(conn, :show, site_publication))
      end
    end
  end

  defp create_site_publication(_) do
    site_publication = fixture(:site_publication)
    {:ok, site_publication: site_publication}
  end
end
