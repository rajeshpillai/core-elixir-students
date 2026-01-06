# 09. Pipelines

# Without pipes, code can get very nested and hard to read.
# Example: Take a list, multiply by 2, then sum them.

# Method 1: Nested (Hard to read)
nums = [1, 2, 3]
result = Enum.sum(Enum.map(nums, fn x -> x * 2 end))
IO.puts("Sum (nested): #{result}")

# Method 2: Pipelines (Clear data flow)
# We read this like: "Take nums, THEN map them, THEN sum them."
result_piped = 
  nums
  |> Enum.map(fn x -> x * 2 end)
  |> Enum.sum()

IO.puts("Sum (piped):  #{result_piped}")

# Another example: String transformation
"  hello elixir world  "
|> String.trim()
|> String.split(" ")
|> Enum.at(1)
|> String.upcase()
|> IO.puts() # Output: ELIXIR
