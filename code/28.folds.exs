# 28. Fold: The Foundation of everything

# In functional theory, 'reduce' is the father of all list functions.
# Let's prove it by building everything using ONLY reduce.

list = [1, 2, 3, 4, 5]

# 1. Custom MAP
my_map = fn data, func -> 
  Enum.reduce(data, [], fn x, acc -> acc ++ [func.(x)] end)
end

IO.puts("Map using Fold: #{inspect(my_map.(list, fn x -> x * 2 end))}")

# 2. Custom FILTER
my_filter = fn data, pred -> 
  Enum.reduce(data, [], fn x, acc -> 
    if pred.(x), do: acc ++ [x], else: acc
  end)
end

IO.puts("Filter using Fold: #{inspect(my_filter.(list, fn x -> rem(x, 2) == 0 end))}")

# 3. Custom REVERSE
my_reverse = fn data -> 
  Enum.reduce(data, [], fn x, acc -> [x] ++ acc end)
end

IO.puts("Reverse using Fold: #{inspect(my_reverse.(list))}")
