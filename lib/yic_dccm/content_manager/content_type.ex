defmodule YicDccm.ContentManager.ContentType do
  use Ecto.Schema
  import Ecto.Changeset
  import Jason
  alias YicDccm.Json

  schema "contenttypes" do
    field :name, :string
    field :definition, Json, default: []
    field :instantiable, :boolean, default: false
    field :combined_definition, {:array, :map}, default: []

    timestamps()
  end

  @doc false
  def changeset(content_type, attrs) do
    content_type
    |> cast(attrs, [:name, :definition, :instantiable])
    |> validate_required([:name, :definition, :instantiable])
    |> build_combined
  end

  defp build_combined(changeset) do
    case get_change(changeset, :definition) do
      nil ->
         changeset
      json when is_binary(json) ->
        {:ok, def} = Jason.decode(json)
        cdef = build_full( get_field( changeset, :name ), def )
        changeset
        |> put_change(:combined_definition, cdef)
    end
  end

  defp build_full type, list do
    full_list = [%{type => list} | build_elements([],list)]
    ## IO.inspect full_list
    remove_doubles full_list, []
  end

  defp remove_doubles([],list), do: list

  defp remove_doubles [item|list], full_list do
    fuller_list = if in_list item, full_list do
      full_list
    else
      [item|full_list]
    end
    remove_doubles list, fuller_list
  end

  defp in_list(item,[]), do: false
  defp in_list(item,[head|tail]) do
    case item == head do
      true ->
        true
      false ->
        in_list item, tail
    end
  end

  defp build_elements( newlist, [] ), do: newlist

  defp build_elements newlist, [item|list] do
    itemtype = Map.get item, "type"
    ## IO.inspect itemtype
    item_def = case YicDccm.ContentManager.get_content_type_by_name itemtype do
      nil ->
        case YicDccm.ContentManager.get_content_basetype_by_name itemtype do
          nil ->
            [%{ itemtype => [%{}] }]
          content_basetype ->
            [%{ itemtype => [%{ type: "base",
                                handler: content_basetype.handler,
                                format: content_basetype.format,
                                validations: content_basetype.validations,
                                data: "" }] }]
        end
      content_type ->
        content_type.combined_definition
    end
    build_elements  item_def ++ newlist, list
  end

end
