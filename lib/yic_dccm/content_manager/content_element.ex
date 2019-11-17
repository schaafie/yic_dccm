defmodule YicDccm.ContentManager.ContentElement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contentelements" do
    field :data, :map
    field :description, :string
    field :name, :string
    belongs_to :content_type, YicDccm.ContentManager.ContentType, [foreign_key: :type_id]
    field :author, :id

    timestamps()
  end

  @doc false
  def changeset(content_element,attrs) when attrs == %{} do
    content_element
    |> cast(attrs, [:name, :description, :type_id, :data])
    |> set_data_on_new()
    |> validate_required([:name, :description, :type_id, :data])
  end

  def changeset(content_element,attrs) do
    ## when attributes data in String format we need to format
    ## data is of map type so we need to decode
    attrs2 = case Map.get( attrs, "data" ) do
      ## when attributes data in not in, we can skip
      nil ->
        attrs
      _ ->
        {_, new_map } = Map.get_and_update(attrs, "data", fn current_value ->
          {:ok, mapped} = Jason.decode current_value
        end)
        new_map
    end
    ## Pass changed decoded data value to cast
    content_element
    |> cast(attrs2, [:name, :description, :type_id, :data])
    |> set_data_on_new()
    |> validate_required([:name, :description, :type_id, :data])
  end

  defp set_data_on_new content_element do
    if is_nil(get_field content_element, :data) do
      case get_field content_element, :type_id do
        nil ->
          content_element
        type_id ->
          content_type = YicDccm.ContentManager.get_content_type!(type_id)
          name = content_type.name
          content_data = %{
            type: name,
            definition: content_type.combined_definition,
            data: build_initial_data( name, content_type.combined_definition )
          }
          put_change(content_element, :data, content_data )
      end
    else
      content_element
    end
  end

  defp build_initial_data root, definition do
    ## find all sub elements in the definition map
    elements = find_in definition, root
    ## filter and keep only required elements
    required = Enum.filter( elements, fn ritem -> ritem["type"]=="base" || ritem["required"] end)
    data = Enum.map( required, fn bitem -> build_data(bitem, definition) end)
    ## data = Enum.map( elements, fn item -> build_data(item, definition) end)
    %{ type: root, data: data }
  end

  defp build_data item, definition do
    case item["type"] do
      "base" ->
        %{ type: "base",
           format: item["format"],
           handler: item["handler"],
           validations: item["validations"],
           data: "" }
      type ->
        ## find all sub elements in the definition map
        elements = find_in definition, type
        ## filter and keep only required elements
        required = Enum.filter( elements, fn ritem -> ritem["type"]=="base" || ritem["required"] end)
        data = Enum.map( required, fn element -> build_data(element, definition) end)
        ## data = Enum.map( elements, fn element -> build_data(element, definition) end)
        %{ type: type,
           multiple: item["multiple"],
           required: item["required"],
           data: data }
    end
  end

  defp find_in([], item), do: []

  defp find_in([head|tail], item) do
    case Map.get(head, item) do
      nil ->
        find_in tail, item
      element ->
        element
    end
  end

end
