# 08. Recursion

defmodule MathUtils do
  # Counting down
  # We use pattern matching to define the "Base Case"
  def countdown(0) do
    IO.puts("Done!")
  end

  def countdown(n) when n > 0 do
    IO.puts(n)
    countdown(n - 1)
  end

  # Summing a list
  # Base Case: Empty list sum is 0
  def sum([]) do
    0
  end

  # Recursive Case: head + sum(tail)
  def sum([head | tail]) do
    head + sum(tail)
  end
end

IO.puts("Countdown:")
MathUtils.countdown(5)

IO.puts("\nSumming a list:")
list = [10, 20, 30]
IO.puts("Sum of #{inspect(list)} is #{MathUtils.sum(list)}")
