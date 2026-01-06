defmodule TaskManager.Server do
  @moduledoc """
  The "Worker" that remembers our tasks.
  """
  use GenServer
  alias TaskManager.Core

  # --- Client API ---

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def add_task(title) do
    GenServer.cast(__MODULE__, {:add, title})
  end

  def complete_task(id) do
    GenServer.cast(__MODULE__, {:complete, id})
  end

  def all_tasks() do
    GenServer.call(__MODULE__, :list)
  end

  # --- Server Callbacks ---

  @impl true
  def init(initial_state) do
    # initial_state is an empty list []
    {:ok, initial_state}
  end

  @impl true
  def handle_cast({:add, title}, tasks) do
    new_tasks = Core.add(tasks, title)
    {:noreply, new_tasks}
  end

  @impl true
  def handle_cast({:complete, id}, tasks) do
    new_tasks = Core.complete(tasks, id)
    {:noreply, new_tasks}
  end

  @impl true
  def handle_call(:list, _from, tasks) do
    {:reply, tasks, tasks}
  end
end
