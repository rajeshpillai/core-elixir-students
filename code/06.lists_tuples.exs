# 06. Lists & Tuples

# --- 1. Lists ---
# Lists are linked. Adding to the front is super fast.
list = [2, 3, 4]
new_list = [1 | list] # Using the | (pipe/cons) operator to prepend
IO.puts("New List: #{inspect(new_list)}")

# Getting parts of a list
first_item = hd(new_list)
remaining_items = tl(new_list)
IO.puts("First: #{first_item}, Rest: #{inspect(remaining_items)}")

# --- 2. Tuples ---
# Tuples are for fixed-size groups of data.
person = {"Rajesh", 30, :expert}

# elem/2 gets an item by index (starting at 0)
name = elem(person, 0)
IO.puts("Hiring: #{name}")

# Standard Elixir pattern: Status Tuples
response = {:ok, "Connected to server"}
IO.puts("Response status: #{elem(response, 0)}")
