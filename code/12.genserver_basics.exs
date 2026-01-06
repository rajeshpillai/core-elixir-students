# 12. GenServer Basics

defmodule MyCounter do
  use GenServer

  # --- Client API ---
  
  def start(initial_value \\ 0) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  def increment() do
    GenServer.cast(__MODULE__, :inc)
  end

  def value() do
    GenServer.call(__MODULE__, :val)
  end

  # --- Server Callbacks ---

  @impl true
  def init(initial_value) do
    {:ok, initial_value}
  end

  @impl true
  def handle_cast(:inc, current_value) do
    {:noreply, current_value + 1}
  end

  @impl true
  def handle_call(:val, _from, current_value) do
    {:reply, current_value, current_value}
  end
end

# Usage:
MyCounter.start(42)
IO.puts("Initial Value: #{MyCounter.value()}")

MyCounter.increment()
MyCounter.increment()
IO.puts("Final Value: #{MyCounter.value()}")
