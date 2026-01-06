defmodule DistributedTaskManager.Server do
  @moduledoc """
  A GenServer that registers itself GLOBALLY in the cluster.
  """
  use GenServer

  # We use a fixed name for the global registry
  @global_name {:global, :distributed_task_manager}

  # --- Client API ---

  def start_link(_opts) do
    # When starting, we check if it's already running somewhere else in the cluster
    case GenServer.start_link(__MODULE__, [], name: @global_name) do
      {:ok, pid} -> {:ok, pid}
      {:error, {:already_started, pid}} -> {:ok, pid}
      other -> other
    end
  end

  def add_task(title) do
    GenServer.cast(@global_name, {:add, title})
  end

  def get_tasks() do
    GenServer.call(@global_name, :get_tasks)
  end

  def complete_task(id) do
    GenServer.cast(@global_name, {:complete, id})
  end

  # --- Server Callbacks ---

  @impl true
  def init(_) do
    IO.puts("\n[GLOBAL] A new Distributed Task Manager has started on node #{node()}!")
    {:ok, []}
  end

  @impl true
  def handle_cast({:add, title}, tasks) do
    new_task = %{id: length(tasks) + 1, title: title, completed: false}
    {:noreply, tasks ++ [new_task]}
  end

  @impl true
  def handle_cast({:complete, id}, tasks) do
    new_tasks = Enum.map(tasks, fn
      %{id: ^id} = task -> %{task | completed: true}
      task -> task
    end)
    {:noreply, new_tasks}
  end

  @impl true
  def handle_call(:get_tasks, _from, tasks) do
    {:reply, tasks, tasks}
  end
end
