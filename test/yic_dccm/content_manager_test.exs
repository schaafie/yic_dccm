defmodule YicDccm.ContentManagerTest do
  use YicDccm.DataCase

  alias YicDccm.ContentManager

  describe "contenttypes" do
    alias YicDccm.ContentManager.ContentType

    @valid_attrs %{combined_definition: %{}, definition: %{}, instantiable: true, name: "some name"}
    @update_attrs %{combined_definition: %{}, definition: %{}, instantiable: false, name: "some updated name"}
    @invalid_attrs %{combined_definition: nil, definition: nil, instantiable: nil, name: nil}

    def content_type_fixture(attrs \\ %{}) do
      {:ok, content_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentManager.create_content_type()

      content_type
    end

    test "list_contenttypes/0 returns all contenttypes" do
      content_type = content_type_fixture()
      assert ContentManager.list_contenttypes() == [content_type]
    end

    test "get_content_type!/1 returns the content_type with given id" do
      content_type = content_type_fixture()
      assert ContentManager.get_content_type!(content_type.id) == content_type
    end

    test "create_content_type/1 with valid data creates a content_type" do
      assert {:ok, %ContentType{} = content_type} = ContentManager.create_content_type(@valid_attrs)
      assert content_type.combined_definition == %{}
      assert content_type.definition == %{}
      assert content_type.instantiable == true
      assert content_type.name == "some name"
    end

    test "create_content_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentManager.create_content_type(@invalid_attrs)
    end

    test "update_content_type/2 with valid data updates the content_type" do
      content_type = content_type_fixture()
      assert {:ok, %ContentType{} = content_type} = ContentManager.update_content_type(content_type, @update_attrs)
      assert content_type.combined_definition == %{}
      assert content_type.definition == %{}
      assert content_type.instantiable == false
      assert content_type.name == "some updated name"
    end

    test "update_content_type/2 with invalid data returns error changeset" do
      content_type = content_type_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentManager.update_content_type(content_type, @invalid_attrs)
      assert content_type == ContentManager.get_content_type!(content_type.id)
    end

    test "delete_content_type/1 deletes the content_type" do
      content_type = content_type_fixture()
      assert {:ok, %ContentType{}} = ContentManager.delete_content_type(content_type)
      assert_raise Ecto.NoResultsError, fn -> ContentManager.get_content_type!(content_type.id) end
    end

    test "change_content_type/1 returns a content_type changeset" do
      content_type = content_type_fixture()
      assert %Ecto.Changeset{} = ContentManager.change_content_type(content_type)
    end
  end

  describe "contentelements" do
    alias YicDccm.ContentManager.ContentElement

    @valid_attrs %{data: %{}, description: "some description", name: "some name"}
    @update_attrs %{data: %{}, description: "some updated description", name: "some updated name"}
    @invalid_attrs %{data: nil, description: nil, name: nil}

    def content_element_fixture(attrs \\ %{}) do
      {:ok, content_element} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentManager.create_content_element()

      content_element
    end

    test "list_contentelements/0 returns all contentelements" do
      content_element = content_element_fixture()
      assert ContentManager.list_contentelements() == [content_element]
    end

    test "get_content_element!/1 returns the content_element with given id" do
      content_element = content_element_fixture()
      assert ContentManager.get_content_element!(content_element.id) == content_element
    end

    test "create_content_element/1 with valid data creates a content_element" do
      assert {:ok, %ContentElement{} = content_element} = ContentManager.create_content_element(@valid_attrs)
      assert content_element.data == %{}
      assert content_element.description == "some description"
      assert content_element.name == "some name"
    end

    test "create_content_element/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentManager.create_content_element(@invalid_attrs)
    end

    test "update_content_element/2 with valid data updates the content_element" do
      content_element = content_element_fixture()
      assert {:ok, %ContentElement{} = content_element} = ContentManager.update_content_element(content_element, @update_attrs)
      assert content_element.data == %{}
      assert content_element.description == "some updated description"
      assert content_element.name == "some updated name"
    end

    test "update_content_element/2 with invalid data returns error changeset" do
      content_element = content_element_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentManager.update_content_element(content_element, @invalid_attrs)
      assert content_element == ContentManager.get_content_element!(content_element.id)
    end

    test "delete_content_element/1 deletes the content_element" do
      content_element = content_element_fixture()
      assert {:ok, %ContentElement{}} = ContentManager.delete_content_element(content_element)
      assert_raise Ecto.NoResultsError, fn -> ContentManager.get_content_element!(content_element.id) end
    end

    test "change_content_element/1 returns a content_element changeset" do
      content_element = content_element_fixture()
      assert %Ecto.Changeset{} = ContentManager.change_content_element(content_element)
    end
  end

  describe "contenttemplates" do
    alias YicDccm.ContentManager.ContentTemplate

    @valid_attrs %{definition: %{}, description: "some description", name: "some name"}
    @update_attrs %{definition: %{}, description: "some updated description", name: "some updated name"}
    @invalid_attrs %{definition: nil, description: nil, name: nil}

    def content_template_fixture(attrs \\ %{}) do
      {:ok, content_template} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentManager.create_content_template()

      content_template
    end

    test "list_contenttemplates/0 returns all contenttemplates" do
      content_template = content_template_fixture()
      assert ContentManager.list_contenttemplates() == [content_template]
    end

    test "get_content_template!/1 returns the content_template with given id" do
      content_template = content_template_fixture()
      assert ContentManager.get_content_template!(content_template.id) == content_template
    end

    test "create_content_template/1 with valid data creates a content_template" do
      assert {:ok, %ContentTemplate{} = content_template} = ContentManager.create_content_template(@valid_attrs)
      assert content_template.definition == %{}
      assert content_template.description == "some description"
      assert content_template.name == "some name"
    end

    test "create_content_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentManager.create_content_template(@invalid_attrs)
    end

    test "update_content_template/2 with valid data updates the content_template" do
      content_template = content_template_fixture()
      assert {:ok, %ContentTemplate{} = content_template} = ContentManager.update_content_template(content_template, @update_attrs)
      assert content_template.definition == %{}
      assert content_template.description == "some updated description"
      assert content_template.name == "some updated name"
    end

    test "update_content_template/2 with invalid data returns error changeset" do
      content_template = content_template_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentManager.update_content_template(content_template, @invalid_attrs)
      assert content_template == ContentManager.get_content_template!(content_template.id)
    end

    test "delete_content_template/1 deletes the content_template" do
      content_template = content_template_fixture()
      assert {:ok, %ContentTemplate{}} = ContentManager.delete_content_template(content_template)
      assert_raise Ecto.NoResultsError, fn -> ContentManager.get_content_template!(content_template.id) end
    end

    test "change_content_template/1 returns a content_template changeset" do
      content_template = content_template_fixture()
      assert %Ecto.Changeset{} = ContentManager.change_content_template(content_template)
    end
  end

  describe "contenttargets" do
    alias YicDccm.ContentManager.ContentTarget

    @valid_attrs %{credentials: "some credentials", description: "some description", method: "some method", name: "some name", target_url: "some target_url", version: "some version"}
    @update_attrs %{credentials: "some updated credentials", description: "some updated description", method: "some updated method", name: "some updated name", target_url: "some updated target_url", version: "some updated version"}
    @invalid_attrs %{credentials: nil, description: nil, method: nil, name: nil, target_url: nil, version: nil}

    def content_target_fixture(attrs \\ %{}) do
      {:ok, content_target} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentManager.create_content_target()

      content_target
    end

    test "list_contenttargets/0 returns all contenttargets" do
      content_target = content_target_fixture()
      assert ContentManager.list_contenttargets() == [content_target]
    end

    test "get_content_target!/1 returns the content_target with given id" do
      content_target = content_target_fixture()
      assert ContentManager.get_content_target!(content_target.id) == content_target
    end

    test "create_content_target/1 with valid data creates a content_target" do
      assert {:ok, %ContentTarget{} = content_target} = ContentManager.create_content_target(@valid_attrs)
      assert content_target.credentials == "some credentials"
      assert content_target.description == "some description"
      assert content_target.method == "some method"
      assert content_target.name == "some name"
      assert content_target.target_url == "some target_url"
      assert content_target.version == "some version"
    end

    test "create_content_target/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentManager.create_content_target(@invalid_attrs)
    end

    test "update_content_target/2 with valid data updates the content_target" do
      content_target = content_target_fixture()
      assert {:ok, %ContentTarget{} = content_target} = ContentManager.update_content_target(content_target, @update_attrs)
      assert content_target.credentials == "some updated credentials"
      assert content_target.description == "some updated description"
      assert content_target.method == "some updated method"
      assert content_target.name == "some updated name"
      assert content_target.target_url == "some updated target_url"
      assert content_target.version == "some updated version"
    end

    test "update_content_target/2 with invalid data returns error changeset" do
      content_target = content_target_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentManager.update_content_target(content_target, @invalid_attrs)
      assert content_target == ContentManager.get_content_target!(content_target.id)
    end

    test "delete_content_target/1 deletes the content_target" do
      content_target = content_target_fixture()
      assert {:ok, %ContentTarget{}} = ContentManager.delete_content_target(content_target)
      assert_raise Ecto.NoResultsError, fn -> ContentManager.get_content_target!(content_target.id) end
    end

    test "change_content_target/1 returns a content_target changeset" do
      content_target = content_target_fixture()
      assert %Ecto.Changeset{} = ContentManager.change_content_target(content_target)
    end
  end

  describe "contentpublications" do
    alias YicDccm.ContentManager.ContentPublication

    @valid_attrs %{down_date: "2010-04-17T14:00:00Z", publication_date: "2010-04-17T14:00:00Z", up_date: "2010-04-17T14:00:00Z"}
    @update_attrs %{down_date: "2011-05-18T15:01:01Z", publication_date: "2011-05-18T15:01:01Z", up_date: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{down_date: nil, publication_date: nil, up_date: nil}

    def content_publication_fixture(attrs \\ %{}) do
      {:ok, content_publication} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentManager.create_content_publication()

      content_publication
    end

    test "list_contentpublications/0 returns all contentpublications" do
      content_publication = content_publication_fixture()
      assert ContentManager.list_contentpublications() == [content_publication]
    end

    test "get_content_publication!/1 returns the content_publication with given id" do
      content_publication = content_publication_fixture()
      assert ContentManager.get_content_publication!(content_publication.id) == content_publication
    end

    test "create_content_publication/1 with valid data creates a content_publication" do
      assert {:ok, %ContentPublication{} = content_publication} = ContentManager.create_content_publication(@valid_attrs)
      assert content_publication.down_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert content_publication.publication_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert content_publication.up_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_content_publication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentManager.create_content_publication(@invalid_attrs)
    end

    test "update_content_publication/2 with valid data updates the content_publication" do
      content_publication = content_publication_fixture()
      assert {:ok, %ContentPublication{} = content_publication} = ContentManager.update_content_publication(content_publication, @update_attrs)
      assert content_publication.down_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert content_publication.publication_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert content_publication.up_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_content_publication/2 with invalid data returns error changeset" do
      content_publication = content_publication_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentManager.update_content_publication(content_publication, @invalid_attrs)
      assert content_publication == ContentManager.get_content_publication!(content_publication.id)
    end

    test "delete_content_publication/1 deletes the content_publication" do
      content_publication = content_publication_fixture()
      assert {:ok, %ContentPublication{}} = ContentManager.delete_content_publication(content_publication)
      assert_raise Ecto.NoResultsError, fn -> ContentManager.get_content_publication!(content_publication.id) end
    end

    test "change_content_publication/1 returns a content_publication changeset" do
      content_publication = content_publication_fixture()
      assert %Ecto.Changeset{} = ContentManager.change_content_publication(content_publication)
    end
  end

  describe "contentbasetypes" do
    alias YicDccm.ContentManager.ContentBasetype

    @valid_attrs %{format: "some format", handler: "some handler", name: "some name", validations: "some validations"}
    @update_attrs %{format: "some updated format", handler: "some updated handler", name: "some updated name", validations: "some updated validations"}
    @invalid_attrs %{format: nil, handler: nil, name: nil, validations: nil}

    def content_basetype_fixture(attrs \\ %{}) do
      {:ok, content_basetype} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ContentManager.create_content_basetype()

      content_basetype
    end

    test "list_contentbasetypes/0 returns all contentbasetypes" do
      content_basetype = content_basetype_fixture()
      assert ContentManager.list_contentbasetypes() == [content_basetype]
    end

    test "get_content_basetype!/1 returns the content_basetype with given id" do
      content_basetype = content_basetype_fixture()
      assert ContentManager.get_content_basetype!(content_basetype.id) == content_basetype
    end

    test "create_content_basetype/1 with valid data creates a content_basetype" do
      assert {:ok, %ContentBasetype{} = content_basetype} = ContentManager.create_content_basetype(@valid_attrs)
      assert content_basetype.format == "some format"
      assert content_basetype.handler == "some handler"
      assert content_basetype.name == "some name"
      assert content_basetype.validations == "some validations"
    end

    test "create_content_basetype/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContentManager.create_content_basetype(@invalid_attrs)
    end

    test "update_content_basetype/2 with valid data updates the content_basetype" do
      content_basetype = content_basetype_fixture()
      assert {:ok, %ContentBasetype{} = content_basetype} = ContentManager.update_content_basetype(content_basetype, @update_attrs)
      assert content_basetype.format == "some updated format"
      assert content_basetype.handler == "some updated handler"
      assert content_basetype.name == "some updated name"
      assert content_basetype.validations == "some updated validations"
    end

    test "update_content_basetype/2 with invalid data returns error changeset" do
      content_basetype = content_basetype_fixture()
      assert {:error, %Ecto.Changeset{}} = ContentManager.update_content_basetype(content_basetype, @invalid_attrs)
      assert content_basetype == ContentManager.get_content_basetype!(content_basetype.id)
    end

    test "delete_content_basetype/1 deletes the content_basetype" do
      content_basetype = content_basetype_fixture()
      assert {:ok, %ContentBasetype{}} = ContentManager.delete_content_basetype(content_basetype)
      assert_raise Ecto.NoResultsError, fn -> ContentManager.get_content_basetype!(content_basetype.id) end
    end

    test "change_content_basetype/1 returns a content_basetype changeset" do
      content_basetype = content_basetype_fixture()
      assert %Ecto.Changeset{} = ContentManager.change_content_basetype(content_basetype)
    end
  end
end
