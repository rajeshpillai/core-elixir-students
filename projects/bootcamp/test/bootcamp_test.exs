defmodule BootcampTest do
  use ExUnit.Case
  doctest Bootcamp

  test "greets the world" do
    assert Bootcamp.hello() == :world
  end
end
