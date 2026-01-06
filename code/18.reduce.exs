# 18. Enum.reduce Mastery

# Use Case 1: The Basics (Summing)
total = Enum.reduce([1, 2, 3, 4], 0, fn x, acc -> x + acc end)
IO.puts("Total: #{total}")


# Use Case 2: Transforming a list into a Map (Grouping)
# We want to group people by their age.
people = [
  %{name: "Alice", age: 25},
  %{name: "Bob", age: 30},
  %{name: "Charlie", age: 25}
]

grouped_by_age = Enum.reduce(people, %{}, fn person, acc ->
  Map.update(acc, person.age, [person.name], fn names -> [person.name | names] end)
end)

IO.puts("\nGrouped by age: #{inspect(grouped_by_age)}")


# Use Case 3: Filtering and Mapping at the same time!
# Let's take numbers, double them, but ONLY if they are even.
mixed_numbers = [1, 2, 3, 4, 5, 6]

doubled_evens = Enum.reduce(mixed_numbers, [], fn x, acc ->
  if rem(x, 2) == 0 do
    [x * 2 | acc]
  else
    acc
  end
end) |> Enum.reverse()

IO.puts("\nDoubled evens: #{inspect(doubled_evens)}")
