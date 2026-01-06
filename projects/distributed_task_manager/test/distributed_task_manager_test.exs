defmodule DistributedTaskManagerTest do
  use ExUnit.Case
  doctest DistributedTaskManager

  test "greets the world" do
    assert DistributedTaskManager.hello() == :world
  end
end
