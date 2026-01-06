defmodule TaskManager.Application do
  @moduledoc """
  The application callback module. Starts the supervision tree.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starting our GenServer automatically!
      {TaskManager.Server, []}
    ]

    opts = [strategy: :one_for_one, name: TaskManager.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
