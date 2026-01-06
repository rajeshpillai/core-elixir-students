# 22. Dynamic Supervisor Demonstration

defmodule TempWorker do
  use GenServer, restart: :temporary

  def start_link(id) do
    GenServer.start_link(__MODULE__, id)
  end

  def init(id) do
    IO.puts("Worker ##{id} hired!")
    {:ok, id}
  end

  def handle_cast(:work, id) do
    IO.puts("Worker ##{id} is doing a task...")
    {:noreply, id}
  end
end

# 1. Start the Dynamic Supervisor
{:ok, sup} = DynamicSupervisor.start_link(strategy: :one_for_one)

# 2. Add children on the fly
{:ok, worker1} = DynamicSupervisor.start_child(sup, {TempWorker, 101})
{:ok, worker2} = DynamicSupervisor.start_child(sup, {TempWorker, 102})

# 3. Use the workers
GenServer.cast(worker1, :work)
GenServer.cast(worker2, :work)

# 4. List children
children = DynamicSupervisor.which_children(sup)
IO.puts("\nActive children list:\n#{inspect(children)}")

# 5. Terminate children manually
IO.puts("\nFiring Worker 101...")
DynamicSupervisor.terminate_child(sup, worker1)

IO.puts("Active children count: #{DynamicSupervisor.count_children(sup).active}")
