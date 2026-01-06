defmodule DistributedTaskManager do
  @moduledoc """
  The node-agnostic API for the Distributed Task Manager.
  """
  alias DistributedTaskManager.Server

  def add_task(title) do
    Server.add_task(title)
  end

  def complete_task(id) do
    Server.complete_task(id)
  end

  def list_tasks do
    tasks = Server.get_tasks()
    
    IO.puts("\n--- GLOBAL TASK LIST (Node: #{node()}) ---")
    if Enum.empty?(tasks) do
      IO.puts("(No tasks yet)")
    else
      Enum.each(tasks, fn task -> 
        status = if task.completed, do: "[X]", else: "[ ]"
        IO.puts("#{task.id}. #{status} #{task.title}")
      end)
    end
    IO.puts("------------------------------------------\n")
  end

  def cluster_info do
    IO.puts("\n--- CLUSTER INFO ---")
    IO.puts("Self: #{node()}")
    IO.puts("Connections: #{inspect(Node.list())}")
    IO.puts("---------------------\n")
  end
end
