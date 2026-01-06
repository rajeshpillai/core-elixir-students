# 26. Monoid Laws Demonstration

# Laws:
# 1. Identity: x + empty = x
# 2. Associativity: (a + b) + c = a + (b + c)

IO.puts("--- TESTING MONOID LAWS ---\n")

# 1. Integer Addition (Identity is 0)
x = 10
identity = 0
IO.puts("Law of Identity (Integer): #{x} + #{identity} = #{x + identity}")

# 2. List Concatenation (Identity is [])
list_a = [1, 2]
list_b = [3, 4]
list_c = [5, 6]
empty = []

IO.puts("Law of Identity (List): #{inspect(list_a)} ++ #{inspect(empty)} = #{inspect(list_a ++ empty)}")

# 3. Associativity (The 'Grouping' rule)
left_group = (list_a ++ list_b) ++ list_c
right_group = list_a ++ (list_b ++ list_c)

IO.puts("Law of Associativity: Is Grouping equal? #{left_group == right_group}")
IO.puts("Result: #{inspect(left_group)}")
