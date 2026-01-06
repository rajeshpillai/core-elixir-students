# 17. Protocols & Polymorphism

# 1. THE PROTOCOL
defprotocol DataSize do
  @doc "Returns a descriptive size of the data"
  def size(data)
end

# 2. IMPLEMENTATIONS
defimpl DataSize, for: BitString do
  def size(str), do: "This string has #{String.length(str)} characters."
end

defimpl DataSize, for: List do
  def size(list), do: "This list has #{length(list)} items."
end

defimpl DataSize, for: Map do
  def size(map), do: "This map has #{map_size(map)} keys."
end

defmodule Box do
  defstruct items: []
end

defimpl DataSize, for: Box do
  def size(box), do: "The box contains #{length(box.items)} items."
end

# 3. USAGE
# Notice we call the SAME function on different types!
IO.puts(DataSize.size("Hello Elixir"))
IO.puts(DataSize.size([1, 2, 3]))
IO.puts(DataSize.size(%{a: 1, b: 2}))
IO.puts(DataSize.size(%Box{items: [:toy, :book]}))
