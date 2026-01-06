defmodule DistributedTaskManager.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DistributedTaskManager.Server, []}
    ]

    opts = [strategy: :one_for_one, name: DistributedTaskManager.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
