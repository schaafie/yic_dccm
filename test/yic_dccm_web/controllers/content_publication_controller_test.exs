defmodule YicDccmWeb.ContentPublicationControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.ContentManager

  @create_attrs %{down_date: "2010-04-17T14:00:00Z", publication_date: "2010-04-17T14:00:00Z", up_date: "2010-04-17T14:00:00Z"}
  @update_attrs %{down_date: "2011-05-18T15:01:01Z", publication_date: "2011-05-18T15:01:01Z", up_date: "2011-05-18T15:01:01Z"}
  @invalid_attrs %{down_date: nil, publication_date: nil, up_date: nil}

  def fixture(:content_publication) do
    {:ok, content_publication} = ContentManager.create_content_publication(@create_attrs)
    content_publication
  end

  describe "index" do
    test "lists all contentpublications", %{conn: conn} do
      conn = get(conn, Routes.content_publication_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contentpublications"
    end
  end

  describe "new content_publication" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.content_publication_path(conn, :new))
      assert html_response(conn, 200) =~ "New Content publication"
    end
  end

  describe "create content_publication" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.content_publication_path(conn, :create), content_publication: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.content_publication_path(conn, :show, id)

      conn = get(conn, Routes.content_publication_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Content publication"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.content_publication_path(conn, :create), content_publication: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content publication"
    end
  end

  describe "edit content_publication" do
    setup [:create_content_publication]

    test "renders form for editing chosen content_publication", %{conn: conn, content_publication: content_publication} do
      conn = get(conn, Routes.content_publication_path(conn, :edit, content_publication))
      assert html_response(conn, 200) =~ "Edit Content publication"
    end
  end

  describe "update content_publication" do
    setup [:create_content_publication]

    test "redirects when data is valid", %{conn: conn, content_publication: content_publication} do
      conn = put(conn, Routes.content_publication_path(conn, :update, content_publication), content_publication: @update_attrs)
      assert redirected_to(conn) == Routes.content_publication_path(conn, :show, content_publication)

      conn = get(conn, Routes.content_publication_path(conn, :show, content_publication))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, content_publication: content_publication} do
      conn = put(conn, Routes.content_publication_path(conn, :update, content_publication), content_publication: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content publication"
    end
  end

  describe "delete content_publication" do
    setup [:create_content_publication]

    test "deletes chosen content_publication", %{conn: conn, content_publication: content_publication} do
      conn = delete(conn, Routes.content_publication_path(conn, :delete, content_publication))
      assert redirected_to(conn) == Routes.content_publication_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.content_publication_path(conn, :show, content_publication))
      end
    end
  end

  defp create_content_publication(_) do
    content_publication = fixture(:content_publication)
    {:ok, content_publication: content_publication}
  end
end
