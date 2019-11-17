defmodule YicDccm.SiteManager do
  @moduledoc """
  The SiteManager context.
  """

  import Ecto.Query, warn: false
  alias YicDccm.Repo

  alias YicDccm.SiteManager.Site

  @doc """
  Returns the list of sites.

  ## Examples

      iex> list_sites()
      [%Site{}, ...]

  """
  def list_sites do
    Repo.all(Site)
  end

  @doc """
  Gets a single site.

  Raises `Ecto.NoResultsError` if the Site does not exist.

  ## Examples

      iex> get_site!(123)
      %Site{}

      iex> get_site!(456)
      ** (Ecto.NoResultsError)

  """
  def get_site!(id), do: Repo.get!(Site, id)

  @doc """
  Creates a site.

  ## Examples

      iex> create_site(%{field: value})
      {:ok, %Site{}}

      iex> create_site(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_site(attrs \\ %{}) do
    %Site{}
    |> Site.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a site.

  ## Examples

      iex> update_site(site, %{field: new_value})
      {:ok, %Site{}}

      iex> update_site(site, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_site(%Site{} = site, attrs) do
    site
    |> Site.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Site.

  ## Examples

      iex> delete_site(site)
      {:ok, %Site{}}

      iex> delete_site(site)
      {:error, %Ecto.Changeset{}}

  """
  def delete_site(%Site{} = site) do
    Repo.delete(site)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking site changes.

  ## Examples

      iex> change_site(site)
      %Ecto.Changeset{source: %Site{}}

  """
  def change_site(%Site{} = site) do
    Site.changeset(site, %{})
  end

  alias YicDccm.SiteManager.PageLayout

  @doc """
  Returns the list of pagelayouts.

  ## Examples

      iex> list_pagelayouts()
      [%PageLayout{}, ...]

  """
  def list_pagelayouts do
    Repo.all(PageLayout)
  end

  @doc """
  Gets a single page_layout.

  Raises `Ecto.NoResultsError` if the Page layout does not exist.

  ## Examples

      iex> get_page_layout!(123)
      %PageLayout{}

      iex> get_page_layout!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page_layout!(id), do: Repo.get!(PageLayout, id)

  @doc """
  Creates a page_layout.

  ## Examples

      iex> create_page_layout(%{field: value})
      {:ok, %PageLayout{}}

      iex> create_page_layout(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page_layout(attrs \\ %{}) do
    %PageLayout{}
    |> PageLayout.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a page_layout.

  ## Examples

      iex> update_page_layout(page_layout, %{field: new_value})
      {:ok, %PageLayout{}}

      iex> update_page_layout(page_layout, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_page_layout(%PageLayout{} = page_layout, attrs) do
    page_layout
    |> PageLayout.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PageLayout.

  ## Examples

      iex> delete_page_layout(page_layout)
      {:ok, %PageLayout{}}

      iex> delete_page_layout(page_layout)
      {:error, %Ecto.Changeset{}}

  """
  def delete_page_layout(%PageLayout{} = page_layout) do
    Repo.delete(page_layout)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page_layout changes.

  ## Examples

      iex> change_page_layout(page_layout)
      %Ecto.Changeset{source: %PageLayout{}}

  """
  def change_page_layout(%PageLayout{} = page_layout) do
    PageLayout.changeset(page_layout, %{})
  end

  alias YicDccm.SiteManager.Page

  @doc """
  Returns the list of pages.

  ## Examples

      iex> list_pages()
      [%Page{}, ...]

  """
  def list_pages do
    Repo.all(Page)
  end

  @doc """
  Gets a single page.

  Raises `Ecto.NoResultsError` if the Page does not exist.

  ## Examples

      iex> get_page!(123)
      %Page{}

      iex> get_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page!(id), do: Repo.get!(Page, id)

  @doc """
  Creates a page.

  ## Examples

      iex> create_page(%{field: value})
      {:ok, %Page{}}

      iex> create_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page(attrs \\ %{}) do
    %Page{}
    |> Page.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a page.

  ## Examples

      iex> update_page(page, %{field: new_value})
      {:ok, %Page{}}

      iex> update_page(page, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_page(%Page{} = page, attrs) do
    page
    |> Page.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Page.

  ## Examples

      iex> delete_page(page)
      {:ok, %Page{}}

      iex> delete_page(page)
      {:error, %Ecto.Changeset{}}

  """
  def delete_page(%Page{} = page) do
    Repo.delete(page)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page changes.

  ## Examples

      iex> change_page(page)
      %Ecto.Changeset{source: %Page{}}

  """
  def change_page(%Page{} = page) do
    Page.changeset(page, %{})
  end

  alias YicDccm.SiteManager.VisualComponent

  @doc """
  Returns the list of visualcomponents.

  ## Examples

      iex> list_visualcomponents()
      [%VisualComponent{}, ...]

  """
  def list_visualcomponents do
    Repo.all(VisualComponent)
  end

  @doc """
  Gets a single visual_component.

  Raises `Ecto.NoResultsError` if the Visual component does not exist.

  ## Examples

      iex> get_visual_component!(123)
      %VisualComponent{}

      iex> get_visual_component!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visual_component!(id), do: Repo.get!(VisualComponent, id)

  @doc """
  Creates a visual_component.

  ## Examples

      iex> create_visual_component(%{field: value})
      {:ok, %VisualComponent{}}

      iex> create_visual_component(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visual_component(attrs \\ %{}) do
    %VisualComponent{}
    |> VisualComponent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visual_component.

  ## Examples

      iex> update_visual_component(visual_component, %{field: new_value})
      {:ok, %VisualComponent{}}

      iex> update_visual_component(visual_component, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visual_component(%VisualComponent{} = visual_component, attrs) do
    visual_component
    |> VisualComponent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a VisualComponent.

  ## Examples

      iex> delete_visual_component(visual_component)
      {:ok, %VisualComponent{}}

      iex> delete_visual_component(visual_component)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visual_component(%VisualComponent{} = visual_component) do
    Repo.delete(visual_component)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visual_component changes.

  ## Examples

      iex> change_visual_component(visual_component)
      %Ecto.Changeset{source: %VisualComponent{}}

  """
  def change_visual_component(%VisualComponent{} = visual_component) do
    VisualComponent.changeset(visual_component, %{})
  end

  alias YicDccm.SiteManager.FunctionalComponent

  @doc """
  Returns the list of functionalcomponents.

  ## Examples

      iex> list_functionalcomponents()
      [%FunctionalComponent{}, ...]

  """
  def list_functionalcomponents do
    Repo.all(FunctionalComponent)
  end

  @doc """
  Gets a single functional_component.

  Raises `Ecto.NoResultsError` if the Functional component does not exist.

  ## Examples

      iex> get_functional_component!(123)
      %FunctionalComponent{}

      iex> get_functional_component!(456)
      ** (Ecto.NoResultsError)

  """
  def get_functional_component!(id), do: Repo.get!(FunctionalComponent, id)

  @doc """
  Creates a functional_component.

  ## Examples

      iex> create_functional_component(%{field: value})
      {:ok, %FunctionalComponent{}}

      iex> create_functional_component(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_functional_component(attrs \\ %{}) do
    %FunctionalComponent{}
    |> FunctionalComponent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a functional_component.

  ## Examples

      iex> update_functional_component(functional_component, %{field: new_value})
      {:ok, %FunctionalComponent{}}

      iex> update_functional_component(functional_component, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_functional_component(%FunctionalComponent{} = functional_component, attrs) do
    functional_component
    |> FunctionalComponent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FunctionalComponent.

  ## Examples

      iex> delete_functional_component(functional_component)
      {:ok, %FunctionalComponent{}}

      iex> delete_functional_component(functional_component)
      {:error, %Ecto.Changeset{}}

  """
  def delete_functional_component(%FunctionalComponent{} = functional_component) do
    Repo.delete(functional_component)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking functional_component changes.

  ## Examples

      iex> change_functional_component(functional_component)
      %Ecto.Changeset{source: %FunctionalComponent{}}

  """
  def change_functional_component(%FunctionalComponent{} = functional_component) do
    FunctionalComponent.changeset(functional_component, %{})
  end

  alias YicDccm.SiteManager.SiteTarget

  @doc """
  Returns the list of sitetargets.

  ## Examples

      iex> list_sitetargets()
      [%SiteTarget{}, ...]

  """
  def list_sitetargets do
    Repo.all(SiteTarget)
  end

  @doc """
  Gets a single site_target.

  Raises `Ecto.NoResultsError` if the Site target does not exist.

  ## Examples

      iex> get_site_target!(123)
      %SiteTarget{}

      iex> get_site_target!(456)
      ** (Ecto.NoResultsError)

  """
  def get_site_target!(id), do: Repo.get!(SiteTarget, id)

  @doc """
  Creates a site_target.

  ## Examples

      iex> create_site_target(%{field: value})
      {:ok, %SiteTarget{}}

      iex> create_site_target(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_site_target(attrs \\ %{}) do
    %SiteTarget{}
    |> SiteTarget.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a site_target.

  ## Examples

      iex> update_site_target(site_target, %{field: new_value})
      {:ok, %SiteTarget{}}

      iex> update_site_target(site_target, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_site_target(%SiteTarget{} = site_target, attrs) do
    site_target
    |> SiteTarget.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SiteTarget.

  ## Examples

      iex> delete_site_target(site_target)
      {:ok, %SiteTarget{}}

      iex> delete_site_target(site_target)
      {:error, %Ecto.Changeset{}}

  """
  def delete_site_target(%SiteTarget{} = site_target) do
    Repo.delete(site_target)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking site_target changes.

  ## Examples

      iex> change_site_target(site_target)
      %Ecto.Changeset{source: %SiteTarget{}}

  """
  def change_site_target(%SiteTarget{} = site_target) do
    SiteTarget.changeset(site_target, %{})
  end

  alias YicDccm.SiteManager.SitePublication

  @doc """
  Returns the list of sitepublications.

  ## Examples

      iex> list_sitepublications()
      [%SitePublication{}, ...]

  """
  def list_sitepublications do
    Repo.all(SitePublication)
  end

  @doc """
  Gets a single site_publication.

  Raises `Ecto.NoResultsError` if the Site publication does not exist.

  ## Examples

      iex> get_site_publication!(123)
      %SitePublication{}

      iex> get_site_publication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_site_publication!(id), do: Repo.get!(SitePublication, id)

  @doc """
  Creates a site_publication.

  ## Examples

      iex> create_site_publication(%{field: value})
      {:ok, %SitePublication{}}

      iex> create_site_publication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_site_publication(attrs \\ %{}) do
    %SitePublication{}
    |> SitePublication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a site_publication.

  ## Examples

      iex> update_site_publication(site_publication, %{field: new_value})
      {:ok, %SitePublication{}}

      iex> update_site_publication(site_publication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_site_publication(%SitePublication{} = site_publication, attrs) do
    site_publication
    |> SitePublication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SitePublication.

  ## Examples

      iex> delete_site_publication(site_publication)
      {:ok, %SitePublication{}}

      iex> delete_site_publication(site_publication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_site_publication(%SitePublication{} = site_publication) do
    Repo.delete(site_publication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking site_publication changes.

  ## Examples

      iex> change_site_publication(site_publication)
      %Ecto.Changeset{source: %SitePublication{}}

  """
  def change_site_publication(%SitePublication{} = site_publication) do
    SitePublication.changeset(site_publication, %{})
  end

  alias YicDccm.SiteManager.WebSnippet

  @doc """
  Returns the list of websnippets.

  ## Examples

      iex> list_websnippets()
      [%WebSnippet{}, ...]

  """
  def list_websnippets do
    Repo.all(WebSnippet)
  end

  @doc """
  Gets a single web_snippet.

  Raises `Ecto.NoResultsError` if the Web snippet does not exist.

  ## Examples

      iex> get_web_snippet!(123)
      %WebSnippet{}

      iex> get_web_snippet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_web_snippet!(id), do: Repo.get!(WebSnippet, id)

  @doc """
  Creates a web_snippet.

  ## Examples

      iex> create_web_snippet(%{field: value})
      {:ok, %WebSnippet{}}

      iex> create_web_snippet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_web_snippet(attrs \\ %{}) do
    %WebSnippet{}
    |> WebSnippet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a web_snippet.

  ## Examples

      iex> update_web_snippet(web_snippet, %{field: new_value})
      {:ok, %WebSnippet{}}

      iex> update_web_snippet(web_snippet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_web_snippet(%WebSnippet{} = web_snippet, attrs) do
    web_snippet
    |> WebSnippet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a WebSnippet.

  ## Examples

      iex> delete_web_snippet(web_snippet)
      {:ok, %WebSnippet{}}

      iex> delete_web_snippet(web_snippet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_web_snippet(%WebSnippet{} = web_snippet) do
    Repo.delete(web_snippet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking web_snippet changes.

  ## Examples

      iex> change_web_snippet(web_snippet)
      %Ecto.Changeset{source: %WebSnippet{}}

  """
  def change_web_snippet(%WebSnippet{} = web_snippet) do
    WebSnippet.changeset(web_snippet, %{})
  end
end
