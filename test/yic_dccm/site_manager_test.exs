defmodule YicDccm.SiteManagerTest do
  use YicDccm.DataCase

  alias YicDccm.SiteManager

  describe "sites" do
    alias YicDccm.SiteManager.Site

    @valid_attrs %{description: "some description", metadata: [], name: "some name"}
    @update_attrs %{description: "some updated description", metadata: [], name: "some updated name"}
    @invalid_attrs %{description: nil, metadata: nil, name: nil}

    def site_fixture(attrs \\ %{}) do
      {:ok, site} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_site()

      site
    end

    test "list_sites/0 returns all sites" do
      site = site_fixture()
      assert SiteManager.list_sites() == [site]
    end

    test "get_site!/1 returns the site with given id" do
      site = site_fixture()
      assert SiteManager.get_site!(site.id) == site
    end

    test "create_site/1 with valid data creates a site" do
      assert {:ok, %Site{} = site} = SiteManager.create_site(@valid_attrs)
      assert site.description == "some description"
      assert site.metadata == []
      assert site.name == "some name"
    end

    test "create_site/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_site(@invalid_attrs)
    end

    test "update_site/2 with valid data updates the site" do
      site = site_fixture()
      assert {:ok, %Site{} = site} = SiteManager.update_site(site, @update_attrs)
      assert site.description == "some updated description"
      assert site.metadata == []
      assert site.name == "some updated name"
    end

    test "update_site/2 with invalid data returns error changeset" do
      site = site_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_site(site, @invalid_attrs)
      assert site == SiteManager.get_site!(site.id)
    end

    test "delete_site/1 deletes the site" do
      site = site_fixture()
      assert {:ok, %Site{}} = SiteManager.delete_site(site)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_site!(site.id) end
    end

    test "change_site/1 returns a site changeset" do
      site = site_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_site(site)
    end
  end

  describe "pagelayouts" do
    alias YicDccm.SiteManager.PageLayout

    @valid_attrs %{creation_datetime: "2010-04-17T14:00:00Z", data: "some data", name: "some name"}
    @update_attrs %{creation_datetime: "2011-05-18T15:01:01Z", data: "some updated data", name: "some updated name"}
    @invalid_attrs %{creation_datetime: nil, data: nil, name: nil}

    def page_layout_fixture(attrs \\ %{}) do
      {:ok, page_layout} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_page_layout()

      page_layout
    end

    test "list_pagelayouts/0 returns all pagelayouts" do
      page_layout = page_layout_fixture()
      assert SiteManager.list_pagelayouts() == [page_layout]
    end

    test "get_page_layout!/1 returns the page_layout with given id" do
      page_layout = page_layout_fixture()
      assert SiteManager.get_page_layout!(page_layout.id) == page_layout
    end

    test "create_page_layout/1 with valid data creates a page_layout" do
      assert {:ok, %PageLayout{} = page_layout} = SiteManager.create_page_layout(@valid_attrs)
      assert page_layout.creation_datetime == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert page_layout.data == "some data"
      assert page_layout.name == "some name"
    end

    test "create_page_layout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_page_layout(@invalid_attrs)
    end

    test "update_page_layout/2 with valid data updates the page_layout" do
      page_layout = page_layout_fixture()
      assert {:ok, %PageLayout{} = page_layout} = SiteManager.update_page_layout(page_layout, @update_attrs)
      assert page_layout.creation_datetime == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert page_layout.data == "some updated data"
      assert page_layout.name == "some updated name"
    end

    test "update_page_layout/2 with invalid data returns error changeset" do
      page_layout = page_layout_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_page_layout(page_layout, @invalid_attrs)
      assert page_layout == SiteManager.get_page_layout!(page_layout.id)
    end

    test "delete_page_layout/1 deletes the page_layout" do
      page_layout = page_layout_fixture()
      assert {:ok, %PageLayout{}} = SiteManager.delete_page_layout(page_layout)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_page_layout!(page_layout.id) end
    end

    test "change_page_layout/1 returns a page_layout changeset" do
      page_layout = page_layout_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_page_layout(page_layout)
    end
  end

  describe "pagetemplates" do
    alias YicDccm.SiteManager.PageTemplate

    @valid_attrs %{creation_datetime: "2010-04-17T14:00:00Z", data: "some data", name: "some name"}
    @update_attrs %{creation_datetime: "2011-05-18T15:01:01Z", data: "some updated data", name: "some updated name"}
    @invalid_attrs %{creation_datetime: nil, data: nil, name: nil}

    def page_template_fixture(attrs \\ %{}) do
      {:ok, page_template} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_page_template()

      page_template
    end

    test "list_pagetemplates/0 returns all pagetemplates" do
      page_template = page_template_fixture()
      assert SiteManager.list_pagetemplates() == [page_template]
    end

    test "get_page_template!/1 returns the page_template with given id" do
      page_template = page_template_fixture()
      assert SiteManager.get_page_template!(page_template.id) == page_template
    end

    test "create_page_template/1 with valid data creates a page_template" do
      assert {:ok, %PageTemplate{} = page_template} = SiteManager.create_page_template(@valid_attrs)
      assert page_template.creation_datetime == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert page_template.data == "some data"
      assert page_template.name == "some name"
    end

    test "create_page_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_page_template(@invalid_attrs)
    end

    test "update_page_template/2 with valid data updates the page_template" do
      page_template = page_template_fixture()
      assert {:ok, %PageTemplate{} = page_template} = SiteManager.update_page_template(page_template, @update_attrs)
      assert page_template.creation_datetime == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert page_template.data == "some updated data"
      assert page_template.name == "some updated name"
    end

    test "update_page_template/2 with invalid data returns error changeset" do
      page_template = page_template_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_page_template(page_template, @invalid_attrs)
      assert page_template == SiteManager.get_page_template!(page_template.id)
    end

    test "delete_page_template/1 deletes the page_template" do
      page_template = page_template_fixture()
      assert {:ok, %PageTemplate{}} = SiteManager.delete_page_template(page_template)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_page_template!(page_template.id) end
    end

    test "change_page_template/1 returns a page_template changeset" do
      page_template = page_template_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_page_template(page_template)
    end
  end

  describe "pages" do
    alias YicDccm.SiteManager.Page

    @valid_attrs %{body: "some body", footer: "some footer", header: "some header", location: "some location", title: "some title"}
    @update_attrs %{body: "some updated body", footer: "some updated footer", header: "some updated header", location: "some updated location", title: "some updated title"}
    @invalid_attrs %{body: nil, footer: nil, header: nil, location: nil, title: nil}

    def page_fixture(attrs \\ %{}) do
      {:ok, page} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_page()

      page
    end

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert SiteManager.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert SiteManager.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      assert {:ok, %Page{} = page} = SiteManager.create_page(@valid_attrs)
      assert page.body == "some body"
      assert page.footer == "some footer"
      assert page.header == "some header"
      assert page.location == "some location"
      assert page.title == "some title"
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      assert {:ok, %Page{} = page} = SiteManager.update_page(page, @update_attrs)
      assert page.body == "some updated body"
      assert page.footer == "some updated footer"
      assert page.header == "some updated header"
      assert page.location == "some updated location"
      assert page.title == "some updated title"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_page(page, @invalid_attrs)
      assert page == SiteManager.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = SiteManager.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_page(page)
    end
  end

  describe "visualcomponents" do
    alias YicDccm.SiteManager.VisualComponent

    @valid_attrs %{definition: %{}, description: "some description", instantiable: true, name: "some name"}
    @update_attrs %{definition: %{}, description: "some updated description", instantiable: false, name: "some updated name"}
    @invalid_attrs %{definition: nil, description: nil, instantiable: nil, name: nil}

    def visual_component_fixture(attrs \\ %{}) do
      {:ok, visual_component} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_visual_component()

      visual_component
    end

    test "list_visualcomponents/0 returns all visualcomponents" do
      visual_component = visual_component_fixture()
      assert SiteManager.list_visualcomponents() == [visual_component]
    end

    test "get_visual_component!/1 returns the visual_component with given id" do
      visual_component = visual_component_fixture()
      assert SiteManager.get_visual_component!(visual_component.id) == visual_component
    end

    test "create_visual_component/1 with valid data creates a visual_component" do
      assert {:ok, %VisualComponent{} = visual_component} = SiteManager.create_visual_component(@valid_attrs)
      assert visual_component.definition == %{}
      assert visual_component.description == "some description"
      assert visual_component.instantiable == true
      assert visual_component.name == "some name"
    end

    test "create_visual_component/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_visual_component(@invalid_attrs)
    end

    test "update_visual_component/2 with valid data updates the visual_component" do
      visual_component = visual_component_fixture()
      assert {:ok, %VisualComponent{} = visual_component} = SiteManager.update_visual_component(visual_component, @update_attrs)
      assert visual_component.definition == %{}
      assert visual_component.description == "some updated description"
      assert visual_component.instantiable == false
      assert visual_component.name == "some updated name"
    end

    test "update_visual_component/2 with invalid data returns error changeset" do
      visual_component = visual_component_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_visual_component(visual_component, @invalid_attrs)
      assert visual_component == SiteManager.get_visual_component!(visual_component.id)
    end

    test "delete_visual_component/1 deletes the visual_component" do
      visual_component = visual_component_fixture()
      assert {:ok, %VisualComponent{}} = SiteManager.delete_visual_component(visual_component)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_visual_component!(visual_component.id) end
    end

    test "change_visual_component/1 returns a visual_component changeset" do
      visual_component = visual_component_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_visual_component(visual_component)
    end
  end

  describe "functionalcomponents" do
    alias YicDccm.SiteManager.FunctionalComponent

    @valid_attrs %{definition: %{}, description: "some description", instantiable: true, name: "some name"}
    @update_attrs %{definition: %{}, description: "some updated description", instantiable: false, name: "some updated name"}
    @invalid_attrs %{definition: nil, description: nil, instantiable: nil, name: nil}

    def functional_component_fixture(attrs \\ %{}) do
      {:ok, functional_component} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_functional_component()

      functional_component
    end

    test "list_functionalcomponents/0 returns all functionalcomponents" do
      functional_component = functional_component_fixture()
      assert SiteManager.list_functionalcomponents() == [functional_component]
    end

    test "get_functional_component!/1 returns the functional_component with given id" do
      functional_component = functional_component_fixture()
      assert SiteManager.get_functional_component!(functional_component.id) == functional_component
    end

    test "create_functional_component/1 with valid data creates a functional_component" do
      assert {:ok, %FunctionalComponent{} = functional_component} = SiteManager.create_functional_component(@valid_attrs)
      assert functional_component.definition == %{}
      assert functional_component.description == "some description"
      assert functional_component.instantiable == true
      assert functional_component.name == "some name"
    end

    test "create_functional_component/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_functional_component(@invalid_attrs)
    end

    test "update_functional_component/2 with valid data updates the functional_component" do
      functional_component = functional_component_fixture()
      assert {:ok, %FunctionalComponent{} = functional_component} = SiteManager.update_functional_component(functional_component, @update_attrs)
      assert functional_component.definition == %{}
      assert functional_component.description == "some updated description"
      assert functional_component.instantiable == false
      assert functional_component.name == "some updated name"
    end

    test "update_functional_component/2 with invalid data returns error changeset" do
      functional_component = functional_component_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_functional_component(functional_component, @invalid_attrs)
      assert functional_component == SiteManager.get_functional_component!(functional_component.id)
    end

    test "delete_functional_component/1 deletes the functional_component" do
      functional_component = functional_component_fixture()
      assert {:ok, %FunctionalComponent{}} = SiteManager.delete_functional_component(functional_component)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_functional_component!(functional_component.id) end
    end

    test "change_functional_component/1 returns a functional_component changeset" do
      functional_component = functional_component_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_functional_component(functional_component)
    end
  end

  describe "sitetargets" do
    alias YicDccm.SiteManager.SiteTarget

    @valid_attrs %{credentials: "some credentials", description: "some description", method: "some method", name: "some name", target_url: "some target_url"}
    @update_attrs %{credentials: "some updated credentials", description: "some updated description", method: "some updated method", name: "some updated name", target_url: "some updated target_url"}
    @invalid_attrs %{credentials: nil, description: nil, method: nil, name: nil, target_url: nil}

    def site_target_fixture(attrs \\ %{}) do
      {:ok, site_target} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_site_target()

      site_target
    end

    test "list_sitetargets/0 returns all sitetargets" do
      site_target = site_target_fixture()
      assert SiteManager.list_sitetargets() == [site_target]
    end

    test "get_site_target!/1 returns the site_target with given id" do
      site_target = site_target_fixture()
      assert SiteManager.get_site_target!(site_target.id) == site_target
    end

    test "create_site_target/1 with valid data creates a site_target" do
      assert {:ok, %SiteTarget{} = site_target} = SiteManager.create_site_target(@valid_attrs)
      assert site_target.credentials == "some credentials"
      assert site_target.description == "some description"
      assert site_target.method == "some method"
      assert site_target.name == "some name"
      assert site_target.target_url == "some target_url"
    end

    test "create_site_target/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_site_target(@invalid_attrs)
    end

    test "update_site_target/2 with valid data updates the site_target" do
      site_target = site_target_fixture()
      assert {:ok, %SiteTarget{} = site_target} = SiteManager.update_site_target(site_target, @update_attrs)
      assert site_target.credentials == "some updated credentials"
      assert site_target.description == "some updated description"
      assert site_target.method == "some updated method"
      assert site_target.name == "some updated name"
      assert site_target.target_url == "some updated target_url"
    end

    test "update_site_target/2 with invalid data returns error changeset" do
      site_target = site_target_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_site_target(site_target, @invalid_attrs)
      assert site_target == SiteManager.get_site_target!(site_target.id)
    end

    test "delete_site_target/1 deletes the site_target" do
      site_target = site_target_fixture()
      assert {:ok, %SiteTarget{}} = SiteManager.delete_site_target(site_target)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_site_target!(site_target.id) end
    end

    test "change_site_target/1 returns a site_target changeset" do
      site_target = site_target_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_site_target(site_target)
    end
  end

  describe "sitepublications" do
    alias YicDccm.SiteManager.SitePublication

    @valid_attrs %{down_date: "2010-04-17T14:00:00Z", publication_date: "2010-04-17T14:00:00Z", up_date: "2010-04-17T14:00:00Z"}
    @update_attrs %{down_date: "2011-05-18T15:01:01Z", publication_date: "2011-05-18T15:01:01Z", up_date: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{down_date: nil, publication_date: nil, up_date: nil}

    def site_publication_fixture(attrs \\ %{}) do
      {:ok, site_publication} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_site_publication()

      site_publication
    end

    test "list_sitepublications/0 returns all sitepublications" do
      site_publication = site_publication_fixture()
      assert SiteManager.list_sitepublications() == [site_publication]
    end

    test "get_site_publication!/1 returns the site_publication with given id" do
      site_publication = site_publication_fixture()
      assert SiteManager.get_site_publication!(site_publication.id) == site_publication
    end

    test "create_site_publication/1 with valid data creates a site_publication" do
      assert {:ok, %SitePublication{} = site_publication} = SiteManager.create_site_publication(@valid_attrs)
      assert site_publication.down_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert site_publication.publication_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert site_publication.up_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_site_publication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_site_publication(@invalid_attrs)
    end

    test "update_site_publication/2 with valid data updates the site_publication" do
      site_publication = site_publication_fixture()
      assert {:ok, %SitePublication{} = site_publication} = SiteManager.update_site_publication(site_publication, @update_attrs)
      assert site_publication.down_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert site_publication.publication_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert site_publication.up_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_site_publication/2 with invalid data returns error changeset" do
      site_publication = site_publication_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_site_publication(site_publication, @invalid_attrs)
      assert site_publication == SiteManager.get_site_publication!(site_publication.id)
    end

    test "delete_site_publication/1 deletes the site_publication" do
      site_publication = site_publication_fixture()
      assert {:ok, %SitePublication{}} = SiteManager.delete_site_publication(site_publication)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_site_publication!(site_publication.id) end
    end

    test "change_site_publication/1 returns a site_publication changeset" do
      site_publication = site_publication_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_site_publication(site_publication)
    end
  end

  describe "websnippets" do
    alias YicDccm.SiteManager.WebSnippet

    @valid_attrs %{data: "some data", name: "some name"}
    @update_attrs %{data: "some updated data", name: "some updated name"}
    @invalid_attrs %{data: nil, name: nil}

    def web_snippet_fixture(attrs \\ %{}) do
      {:ok, web_snippet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteManager.create_web_snippet()

      web_snippet
    end

    test "list_websnippets/0 returns all websnippets" do
      web_snippet = web_snippet_fixture()
      assert SiteManager.list_websnippets() == [web_snippet]
    end

    test "get_web_snippet!/1 returns the web_snippet with given id" do
      web_snippet = web_snippet_fixture()
      assert SiteManager.get_web_snippet!(web_snippet.id) == web_snippet
    end

    test "create_web_snippet/1 with valid data creates a web_snippet" do
      assert {:ok, %WebSnippet{} = web_snippet} = SiteManager.create_web_snippet(@valid_attrs)
      assert web_snippet.data == "some data"
      assert web_snippet.name == "some name"
    end

    test "create_web_snippet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteManager.create_web_snippet(@invalid_attrs)
    end

    test "update_web_snippet/2 with valid data updates the web_snippet" do
      web_snippet = web_snippet_fixture()
      assert {:ok, %WebSnippet{} = web_snippet} = SiteManager.update_web_snippet(web_snippet, @update_attrs)
      assert web_snippet.data == "some updated data"
      assert web_snippet.name == "some updated name"
    end

    test "update_web_snippet/2 with invalid data returns error changeset" do
      web_snippet = web_snippet_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteManager.update_web_snippet(web_snippet, @invalid_attrs)
      assert web_snippet == SiteManager.get_web_snippet!(web_snippet.id)
    end

    test "delete_web_snippet/1 deletes the web_snippet" do
      web_snippet = web_snippet_fixture()
      assert {:ok, %WebSnippet{}} = SiteManager.delete_web_snippet(web_snippet)
      assert_raise Ecto.NoResultsError, fn -> SiteManager.get_web_snippet!(web_snippet.id) end
    end

    test "change_web_snippet/1 returns a web_snippet changeset" do
      web_snippet = web_snippet_fixture()
      assert %Ecto.Changeset{} = SiteManager.change_web_snippet(web_snippet)
    end
  end
end
