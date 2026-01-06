# 07. Pattern Matching

# 1. Tuples are perfect for matching responses
{:ok, user_name} = {:ok, "Rajesh"}
IO.puts("Hello, #{user_name}")

# 2. Extracting items from a list
[a, b, c] = [10, 20, 30]
IO.puts("Sum: #{a + b + c}")

# 3. Using [head | tail] to match
[head | tail] = ["Red", "Green", "Blue"]
IO.puts("The first color is #{head}. The others are #{inspect(tail)}.")

# 4. The Pin Operator
secret_code = 1234
# Imagine we get this from a keypad
input = 1234

# This checks if input equals the existing secret_code
^secret_code = input 
IO.puts("Access Granted!")

# 5. Ignoring values with _
{_, message} = {:error, "System Overload"}
IO.puts("Wait! Something happened: #{message}")
