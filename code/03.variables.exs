# 03. Variables & Immutability

# 1. Binding a name to a value
name = "Alice"
IO.puts("1. Initial name: " <> name)

# 2. Re-binding the same name to a NEW value
name = "Bob"
IO.puts("2. After re-binding: " <> name)

# 3. The Big Test: Functions
# Let's try to 'UPPERCASE' Bob. 
# String.upcase/1 is a function that makes text loud.
String.upcase(name)

# Did Bob change to "BOB"?
IO.puts("3. Did 'name' change? " <> name) 

# NO! String.upcase returned a NEW string, but we didn't save it anywhere.
# The original "Bob" is still "Bob".

# 4. To catch the change, we must bind the result to a name:
loud_name = String.upcase(name)
IO.puts("4. New variable 'loud_name': " <> loud_name)
IO.puts("5. Original 'name' is STILL: " <> name)

# 5. Using the underscore for unused variables
_unused = "This won't cause a warning because I started it with an underscore!"
