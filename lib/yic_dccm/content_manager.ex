defmodule YicDccm.ContentManager do
  @moduledoc """
  The ContentManager context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias YicDccm.Repo

  alias YicDccm.ContentManager.ContentType

  @doc """
  Returns the list of contenttypes.

  ## Examples

      iex> list_contenttypes()
      [%ContentType{}, ...]

  """
  def list_contenttypes do
    Repo.all(ContentType)
  end

  @doc """
  Gets a single content_type.

  Raises `Ecto.NoResultsError` if the Content type does not exist.

  ## Examples

      iex> get_content_type!(123)
      %ContentType{}

      iex> get_content_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_type!(id) do
    Repo.get!(ContentType, id)
  end

  @doc """
  Gets a single content_type by name.

  ## ==> %ContentType | nil
  """
  def get_content_type_by_name name do
    Repo.get_by ContentType, name: name
  end

  @doc """
  Creates a content_type.

  ## Examples

      iex> create_content_type(%{field: value})
      {:ok, %ContentType{}}

      iex> create_content_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_type(attrs \\ %{}) do
    %ContentType{}
    |> ContentType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_type.

  ## Examples

      iex> update_content_type(content_type, %{field: new_value})
      {:ok, %ContentType{}}

      iex> update_content_type(content_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_type(%ContentType{} = content_type, attrs) do
    content_type
    |> ContentType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContentType.

  ## Examples

      iex> delete_content_type(content_type)
      {:ok, %ContentType{}}

      iex> delete_content_type(content_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_type(%ContentType{} = content_type) do
    Repo.delete(content_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_type changes.

  ## Examples

      iex> change_content_type(content_type)
      %Ecto.Changeset{source: %ContentType{}}

  """
  def change_content_type(%ContentType{} = content_type) do
    ContentType.changeset(content_type, %{})
  end

  alias YicDccm.ContentManager.ContentElement

  @doc """
  Returns the list of contentelements.

  ## Examples

      iex> list_contentelements()
      [%ContentElement{}, ...]

  """
  def list_contentelements do
    Repo.all(ContentElement)
  end

  @doc """
  Gets a single content_element.

  Raises `Ecto.NoResultsError` if the Content element does not exist.

  ## Examples

      iex> get_content_element!(123)
      %ContentElement{}

      iex> get_content_element!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_element!(id), do: Repo.get!(ContentElement, id, preload: [:content_type])

  @doc """
  Creates a content_element.

  ## Examples

      iex> create_content_element(%{field: value})
      {:ok, %ContentElement{}}

      iex> create_content_element(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_element(attrs \\ %{}) do
    %ContentElement{}
    |> ContentElement.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_element.

  ## Examples

      iex> update_content_element(content_element, %{field: new_value})
      {:ok, %ContentElement{}}

      iex> update_content_element(content_element, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_element(%ContentElement{} = content_element, attrs) do
    content_element
    |> ContentElement.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContentElement.

  ## Examples

      iex> delete_content_element(content_element)
      {:ok, %ContentElement{}}

      iex> delete_content_element(content_element)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_element(%ContentElement{} = content_element) do
    Repo.delete(content_element)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_element changes.

  ## Examples

      iex> change_content_element(content_element)
      %Ecto.Changeset{source: %ContentElement{}}

  """
  def change_content_element(%ContentElement{} = content_element) do
    ContentElement.changeset(content_element, %{})
  end

  alias YicDccm.ContentManager.ContentTemplate

  @doc """
  Returns the list of contenttemplates.

  ## Examples

      iex> list_contenttemplates()
      [%ContentTemplate{}, ...]

  """
  def list_contenttemplates do
    Repo.all(ContentTemplate)
  end

  @doc """
  Gets a single content_template.

  Raises `Ecto.NoResultsError` if the Content template does not exist.

  ## Examples

      iex> get_content_template!(123)
      %ContentTemplate{}

      iex> get_content_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_template!(id), do: Repo.get!(ContentTemplate, id)

  @doc """
  Creates a content_template.

  ## Examples

      iex> create_content_template(%{field: value})
      {:ok, %ContentTemplate{}}

      iex> create_content_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_template(attrs \\ %{}) do
    %ContentTemplate{}
    |> ContentTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_template.

  ## Examples

      iex> update_content_template(content_template, %{field: new_value})
      {:ok, %ContentTemplate{}}

      iex> update_content_template(content_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_template(%ContentTemplate{} = content_template, attrs) do
    content_template
    |> ContentTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContentTemplate.

  ## Examples

      iex> delete_content_template(content_template)
      {:ok, %ContentTemplate{}}

      iex> delete_content_template(content_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_template(%ContentTemplate{} = content_template) do
    Repo.delete(content_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_template changes.

  ## Examples

      iex> change_content_template(content_template)
      %Ecto.Changeset{source: %ContentTemplate{}}

  """
  def change_content_template(%ContentTemplate{} = content_template) do
    ContentTemplate.changeset(content_template, %{})
  end

  alias YicDccm.ContentManager.ContentTarget

  @doc """
  Returns the list of contenttargets.

  ## Examples

      iex> list_contenttargets()
      [%ContentTarget{}, ...]

  """
  def list_contenttargets do
    Repo.all(ContentTarget)
  end

  @doc """
  Gets a single content_target.

  Raises `Ecto.NoResultsError` if the Content target does not exist.

  ## Examples

      iex> get_content_target!(123)
      %ContentTarget{}

      iex> get_content_target!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_target!(id), do: Repo.get!(ContentTarget, id)

  @doc """
  Creates a content_target.

  ## Examples

      iex> create_content_target(%{field: value})
      {:ok, %ContentTarget{}}

      iex> create_content_target(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_target(attrs \\ %{}) do
    %ContentTarget{}
    |> ContentTarget.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_target.

  ## Examples

      iex> update_content_target(content_target, %{field: new_value})
      {:ok, %ContentTarget{}}

      iex> update_content_target(content_target, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_target(%ContentTarget{} = content_target, attrs) do
    content_target
    |> ContentTarget.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContentTarget.

  ## Examples

      iex> delete_content_target(content_target)
      {:ok, %ContentTarget{}}

      iex> delete_content_target(content_target)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_target(%ContentTarget{} = content_target) do
    Repo.delete(content_target)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_target changes.

  ## Examples

      iex> change_content_target(content_target)
      %Ecto.Changeset{source: %ContentTarget{}}

  """
  def change_content_target(%ContentTarget{} = content_target) do
    ContentTarget.changeset(content_target, %{})
  end

  alias YicDccm.ContentManager.ContentPublication

  @doc """
  Returns the list of contentpublications.

  ## Examples

      iex> list_contentpublications()
      [%ContentPublication{}, ...]

  """
  def list_contentpublications do
    Repo.all(ContentPublication)
  end

  @doc """
  Gets a single content_publication.

  Raises `Ecto.NoResultsError` if the Content publication does not exist.

  ## Examples

      iex> get_content_publication!(123)
      %ContentPublication{}

      iex> get_content_publication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_publication!(id), do: Repo.get!(ContentPublication, id)

  @doc """
  Creates a content_publication.

  ## Examples

      iex> create_content_publication(%{field: value})
      {:ok, %ContentPublication{}}

      iex> create_content_publication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_publication(attrs \\ %{}) do
    %ContentPublication{}
    |> ContentPublication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_publication.

  ## Examples

      iex> update_content_publication(content_publication, %{field: new_value})
      {:ok, %ContentPublication{}}

      iex> update_content_publication(content_publication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_publication(%ContentPublication{} = content_publication, attrs) do
    content_publication
    |> ContentPublication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContentPublication.

  ## Examples

      iex> delete_content_publication(content_publication)
      {:ok, %ContentPublication{}}

      iex> delete_content_publication(content_publication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_publication(%ContentPublication{} = content_publication) do
    Repo.delete(content_publication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_publication changes.

  ## Examples

      iex> change_content_publication(content_publication)
      %Ecto.Changeset{source: %ContentPublication{}}

  """
  def change_content_publication(%ContentPublication{} = content_publication) do
    ContentPublication.changeset(content_publication, %{})
  end

  alias YicDccm.ContentManager.ContentBasetype

  @doc """
  Returns the list of contentbasetypes.

  ## Examples

      iex> list_contentbasetypes()
      [%ContentBasetype{}, ...]

  """
  def list_contentbasetypes do
    Repo.all(ContentBasetype)
  end

  @doc """
  Gets a single content_basetype.

  Raises `Ecto.NoResultsError` if the Content basetype does not exist.

  ## Examples

      iex> get_content_basetype!(123)
      %ContentBasetype{}

      iex> get_content_basetype!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content_basetype!(id), do: Repo.get!(ContentBasetype, id)

  @doc """
  Gets a single content_basetype by name.

  ## ==> %ContentBasetype | nil
  """
  def get_content_basetype_by_name name do
    Repo.get_by ContentBasetype, name: name
  end

  @doc """
  Creates a content_basetype.

  ## Examples

      iex> create_content_basetype(%{field: value})
      {:ok, %ContentBasetype{}}

      iex> create_content_basetype(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content_basetype(attrs \\ %{}) do
    %ContentBasetype{}
    |> ContentBasetype.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a content_basetype.

  ## Examples

      iex> update_content_basetype(content_basetype, %{field: new_value})
      {:ok, %ContentBasetype{}}

      iex> update_content_basetype(content_basetype, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content_basetype(%ContentBasetype{} = content_basetype, attrs) do
    content_basetype
    |> ContentBasetype.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ContentBasetype.

  ## Examples

      iex> delete_content_basetype(content_basetype)
      {:ok, %ContentBasetype{}}

      iex> delete_content_basetype(content_basetype)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content_basetype(%ContentBasetype{} = content_basetype) do
    Repo.delete(content_basetype)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content_basetype changes.

  ## Examples

      iex> change_content_basetype(content_basetype)
      %Ecto.Changeset{source: %ContentBasetype{}}

  """
  def change_content_basetype(%ContentBasetype{} = content_basetype) do
    ContentBasetype.changeset(content_basetype, %{})
  end
end
