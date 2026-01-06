# 04. Basic & Pure Functions

# In Elixir, functions live inside Modules.
defmodule MyMath do
  @doc "Adds two numbers. This is a PURE function."
  def add(a, b) do
    # Elixir automatically returns the result of the LAST line.
    a + b
  end

  @doc "Doubles a number."
  def double(n) do
    n * 2
  end
end

# Let's use our module!
sum = MyMath.add(10, 20)
IO.puts("Sum: #{sum}") # This is 'Interpolation' - putting a variable inside text!

doubled = MyMath.double(sum)
IO.puts("Doubled: #{doubled}")
