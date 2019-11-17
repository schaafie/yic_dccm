defmodule YicDccmWeb.ContentTypeControllerTest do
  use YicDccmWeb.ConnCase

  alias YicDccm.ContentManager
  alias YicDccm.ContentManager.ContentType

  @create_attrs %{
    combined_definition: %{},
    definition: "some definition",
    instantiable: true,
    name: "some name"
  }
  @update_attrs %{
    combined_definition: %{},
    definition: "some updated definition",
    instantiable: false,
    name: "some updated name"
  }
  @invalid_attrs %{combined_definition: nil, definition: nil, instantiable: nil, name: nil}

  def fixture(:content_type) do
    {:ok, content_type} = ContentManager.create_content_type(@create_attrs)
    content_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contenttypes", %{conn: conn} do
      conn = get(conn, Routes.content_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create content_type" do
    test "renders content_type when data is valid", %{conn: conn} do
      conn = post(conn, Routes.content_type_path(conn, :create), content_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.content_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "combined_definition" => %{},
               "definition" => "some definition",
               "instantiable" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.content_type_path(conn, :create), content_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update content_type" do
    setup [:create_content_type]

    test "renders content_type when data is valid", %{conn: conn, content_type: %ContentType{id: id} = content_type} do
      conn = put(conn, Routes.content_type_path(conn, :update, content_type), content_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.content_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "combined_definition" => {},
               "definition" => "some updated definition",
               "instantiable" => false,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, content_type: content_type} do
      conn = put(conn, Routes.content_type_path(conn, :update, content_type), content_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete content_type" do
    setup [:create_content_type]

    test "deletes chosen content_type", %{conn: conn, content_type: content_type} do
      conn = delete(conn, Routes.content_type_path(conn, :delete, content_type))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.content_type_path(conn, :show, content_type))
      end
    end
  end

  defp create_content_type(_) do
    content_type = fixture(:content_type)
    {:ok, content_type: content_type}
  end
end
