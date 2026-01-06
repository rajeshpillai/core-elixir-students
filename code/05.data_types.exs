# 05. Data Types

# 1. Numbers
# Integers are whole numbers.
age = 25 
# Floats are decimals.
price = 19.99

IO.puts("I am #{age} and the price is #{price}")

# 2. Strings
# Always use double quotes for strings.
first_name = "Joe"
last_name = "Armstrong" # One of the creators of the BEAM!

# Join strings with <>
full_name = first_name <> " " <> last_name
IO.puts("Greeting: Hello, #{full_name}")

# 3. Atoms
# These are labels. Their value is their name.
status = :success
IO.puts("The operation was a #{status}")

# Atoms are perfect for checking state
is_it_working = (status == :success)
IO.puts("Working? #{is_it_working}")
