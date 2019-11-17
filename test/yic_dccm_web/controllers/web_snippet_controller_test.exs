defmodule YicDccmWeb.WebSnippetControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.SiteManager

  @create_attrs %{data: "some data", name: "some name"}
  @update_attrs %{data: "some updated data", name: "some updated name"}
  @invalid_attrs %{data: nil, name: nil}

  def fixture(:web_snippet) do
    {:ok, web_snippet} = SiteManager.create_web_snippet(@create_attrs)
    web_snippet
  end

  describe "index" do
    test "lists all websnippets", %{conn: conn} do
      conn = get(conn, Routes.web_snippet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Websnippets"
    end
  end

  describe "new web_snippet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.web_snippet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Web snippet"
    end
  end

  describe "create web_snippet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.web_snippet_path(conn, :create), web_snippet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.web_snippet_path(conn, :show, id)

      conn = get(conn, Routes.web_snippet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Web snippet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.web_snippet_path(conn, :create), web_snippet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Web snippet"
    end
  end

  describe "edit web_snippet" do
    setup [:create_web_snippet]

    test "renders form for editing chosen web_snippet", %{conn: conn, web_snippet: web_snippet} do
      conn = get(conn, Routes.web_snippet_path(conn, :edit, web_snippet))
      assert html_response(conn, 200) =~ "Edit Web snippet"
    end
  end

  describe "update web_snippet" do
    setup [:create_web_snippet]

    test "redirects when data is valid", %{conn: conn, web_snippet: web_snippet} do
      conn = put(conn, Routes.web_snippet_path(conn, :update, web_snippet), web_snippet: @update_attrs)
      assert redirected_to(conn) == Routes.web_snippet_path(conn, :show, web_snippet)

      conn = get(conn, Routes.web_snippet_path(conn, :show, web_snippet))
      assert html_response(conn, 200) =~ "some updated data"
    end

    test "renders errors when data is invalid", %{conn: conn, web_snippet: web_snippet} do
      conn = put(conn, Routes.web_snippet_path(conn, :update, web_snippet), web_snippet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Web snippet"
    end
  end

  describe "delete web_snippet" do
    setup [:create_web_snippet]

    test "deletes chosen web_snippet", %{conn: conn, web_snippet: web_snippet} do
      conn = delete(conn, Routes.web_snippet_path(conn, :delete, web_snippet))
      assert redirected_to(conn) == Routes.web_snippet_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.web_snippet_path(conn, :show, web_snippet))
      end
    end
  end

  defp create_web_snippet(_) do
    web_snippet = fixture(:web_snippet)
    {:ok, web_snippet: web_snippet}
  end
end
