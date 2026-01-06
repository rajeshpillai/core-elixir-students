defmodule TaskManager.Core do
  @moduledoc """
  The "Brain" of our application. 
  Contains PURE functions for transforming lists of tasks.
  """
  alias TaskManager.Task

  @doc "Adds a new task to the list."
  def add(tasks, title) do
    new_id = length(tasks) + 1
    new_task = Task.new(new_id, title)
    
    # We append to the end for simplicity in this project, 
    # though prepending is faster!
    tasks ++ [new_task]
  end

  @doc "Marks a task as completed by its ID."
  def complete(tasks, id) do
    Enum.map(tasks, fn
      %Task{id: ^id} = task -> %{task | completed: true}
      task -> task
    end)
  end

  @doc "Filters for only completed or pending tasks."
  def filter_by_status(tasks, completed) do
    Enum.filter(tasks, fn task -> task.completed == completed end)
  end
end
