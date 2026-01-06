# 29. Composition Mastery

IO.puts("--- COMPOSING FUNCTIONS ---\n")

# 1. Anonymous Function Composition
# Imagine we want to square a number, then add 5.
square = fn x -> x * x end
add_five = fn x -> x + 5 end

# We can compose them manually
composed_fn = fn x -> x |> square.() |> add_five.() end

IO.puts("Manual Composition (4^2 + 5): #{composed_fn.(4)}")

# 2. Data Pipeline Composition
# This is the "Elixir Way"
"  apple, banana, cherry  "
|> String.trim()
|> String.split(",")
|> Enum.map(&String.trim/1)
|> Enum.map(&String.capitalize/1)
|> Enum.join(" & ")
|> (fn result -> IO.puts("Pipeline Result: #{result}") end).()

# 💡 Pro Tip:
# Composition ONLY works if your functions are PURE.
# If 'String.trim' randomly deleted files, you couldn't trust the chain!
