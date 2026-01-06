defmodule TaskManager.Task do
  @moduledoc """
  Defines the schema for a single Task.
  """
  defstruct id: nil, title: "", completed: false

  def new(id, title) do
    %__MODULE__{id: id, title: title}
  end
end
