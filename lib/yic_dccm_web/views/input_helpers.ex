defmodule YicDccmWeb.InputHelpers do
  use Phoenix.HTML
  import Jason

  def code_input(form, field, opts \\ []) do
    value = Phoenix.HTML.Form.input_value(form, field)
    input_opts = [class: "hidden", wc: opts[:wc], value: value]
    apply(Phoenix.HTML.Form, :textarea, [form, field, input_opts] )
  end

  def json_input(form, field, opts \\ []) do
    # type = opts[:using] || Phoenix.HTML.Form.input_type(form, field)
    value = case Phoenix.HTML.Form.input_value(form, field) do
        val when is_list(val) ->
          {:ok, json} = Jason.encode val
          json
        val when is_map(val) ->
          {:ok, json} = Jason.encode val
          json
        val ->
          val
    end

    input_opts = [class: "hidden", wc: opts[:wc], value: value]
    apply(Phoenix.HTML.Form, :textarea, [form, field, input_opts] )
  end

  def webcomponent(form, field, opts \\ []) do
    value = case Phoenix.HTML.Form.input_value(form, field) do
      val when is_list(val) ->
        {:ok, json} = Jason.encode val
        json
      val when is_map(val) ->
        {:ok, json} = Jason.encode val
        json
      nil ->
        "{}"
      val ->
        val
    end

    id = Phoenix.HTML.Form.input_id(form, field)
    name = Phoenix.HTML.Form.input_name(form, field)
    type = opts[:wc]

    html = "<" <> type <> " id='" <> id <> "' name='" <> name <> "' value='" <> value <> "'></" <> type <> ">"
    {:safe, html}
  end
end
