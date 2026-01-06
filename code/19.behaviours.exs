# 19. Behaviours & Callbacks

defmodule Parser do
  @doc "The contract for all format parsers"
  @callback parse(String.t()) :: {:ok, map()} | {:error, String.t()}
  
  @callback extension() :: String.t()
end

defmodule JSONParser do
  @behaviour Parser

  @impl true
  def extension, do: "json"

  @impl true
  def parse(data) do
    # Imagine real JSON parsing here
    IO.puts("Parsing JSON data...")
    {:ok, %{source: "json", content: data}}
  end
end

defmodule CSVParser do
  @behaviour Parser

  @impl true
  def extension, do: "csv"

  @impl true
  def parse(data) do
    IO.puts("Parsing CSV data...")
    {:ok, %{source: "csv", content: data}}
  end
end

# A generic processor that works with ANY parser
defmodule FileUploader do
  def upload(data, parser_module) do
    IO.puts("Checking if we can handle .#{parser_module.extension()} file...")
    parser_module.parse(data)
  end
end

# Usage
FileUploader.upload("{\"id\": 1}", JSONParser)
FileUploader.upload("id,name\n1,Rajesh", CSVParser)
