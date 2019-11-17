defmodule YicDccm.Json do
  @behaviour Ecto.Type

  def type(), do: :map

  def dump(map) when is_map(map) or is_list(map) do
    {:ok, map}
  end
  def dump(string) when is_binary(string) do
    Jason.decode(string)
  end
  def dump(_), do: :error

  def load(map) when is_map(map) or is_list(map) do
    IO.inspect map
    Jason.encode(map)
  end
  def load(json) when is_binary(json) do
    {:ok, json}
  end
  def load(_), do: :error

  def cast(map) when is_map(map) or is_list(map) do
    Jason.encode(map)
  end
  def cast(json) when is_binary(json) do
    {:ok, json}
  end
  def cast(_other) do
    IO.puts "casting error"
   :error
  end
end
