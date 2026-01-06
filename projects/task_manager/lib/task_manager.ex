defmodule TaskManager do
  @moduledoc """
  The user-facing API for our Task Manager.
  """
  alias TaskManager.Server

  @doc """
  The TaskManager server now starts automatically when you run 'iex -S mix'!
  The Supervision tree ensures the server is always running.
  """

  def add_task(title) do
    if Process.whereis(Server) == nil do
      IO.puts("❌ ERROR: Server not started! This should not happen with a Supervisor.")
    else
      Server.add_task(title)
    end
  end

  def complete_task(id) do
    if Process.whereis(Server) == nil do
      IO.puts("❌ ERROR: Server not started! This should not happen with a Supervisor.")
    else
      Server.complete_task(id)
    end
  end

  def list_tasks do
    if Process.whereis(Server) == nil do
      IO.puts("\n❌ ERROR: The TaskManager Server is not running!")
      IO.puts("Wait for the Supervisor to restart the clerk.\n")
    else
      tasks = Server.all_tasks()
      
      IO.puts("\n--- YOUR TASKS ---")
      Enum.each(tasks, fn task -> 
        status = if task.completed, do: "[X]", else: "[ ]"
        IO.puts("#{task.id}. #{status} #{task.title}")
      end)
      IO.puts("------------------\n")
    end
  end
end
