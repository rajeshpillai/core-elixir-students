# 21. Supervision in Action

# 1. A Worker that might crash
defmodule CrashingWorker do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def init(name) do
    IO.puts("Worker #{name} is starting...")
    {:ok, name}
  end

  def do_work(pid) do
    GenServer.cast(pid, :crash)
  end

  def handle_cast(:crash, name) do
    IO.puts("Worker #{name} is about to CRASH! (Oh no!)")
    # This will cause a crash
    1 / 0
  end
end

# 2. Setting up the Supervisor
IO.puts("--- STARTING THE SUPERVISOR ---")

children = [
  {CrashingWorker, :robot_1}
]

# The Supervisor starts the worker
{:ok, sup_pid} = Supervisor.start_link(children, strategy: :one_for_one)

# 3. Let's kill the worker and see what happens
worker_pid = Process.whereis(:robot_1)
IO.puts("Initial Worker PID: #{inspect(worker_pid)}")

CrashingWorker.do_work(:robot_1)

# Wait a tiny bit for the restart
Process.sleep(200)

new_worker_pid = Process.whereis(:robot_1)
IO.puts("New Worker PID after crash: #{inspect(new_worker_pid)}")

if new_worker_pid != worker_pid do
  IO.puts("SUCCESS: The supervisor saw the crash and gave us a NEW worker!")
end

# Stop the supervisor
Supervisor.stop(sup_pid)
