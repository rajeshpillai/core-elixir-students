# 32. Property-Based Testing Simulation

# Since we don't have StreamData library installed by default, 
# let's SIMULATE a property test using random data!

IO.puts("--- SIMULATING PROPERTY-BASED TEST ---\n")

defmodule MyReliableSystem do
  # The rule (Invariant): A reversed list, if reversed again, must match the original.
  def invariant?(list) do
    list == list |> Enum.reverse() |> Enum.reverse()
  end
end

# The Generator: Creating 100 random lists
tests = 1..100 |> Enum.map(fn _ -> 
  # Generate a list with random length and random numbers
  length = :rand.uniform(10)
  1..length |> Enum.map(fn _ -> :rand.uniform(100) end)
end)

# The Execution
failures = Enum.filter(tests, fn list -> 
  !MyReliableSystem.invariant?(list)
end)

if Enum.empty?(failures) do
  IO.puts("SUCCESS: Tested 100 random lists. The property 'Double Reverse' holds true! ✅")
else
  IO.puts("FAILURE: Found a bug! Smallest case: #{inspect(List.first(failures))}")
end

# 💡 Why this is cool:
# We didn't write [1,2,3]. We wrote code that checks the TRUTH 
# for ANYTHING we throw at it.
