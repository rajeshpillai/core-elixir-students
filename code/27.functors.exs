# 27. Functor Laws Demonstration

IO.puts("--- TESTING FUNCTOR LAWS ---\n")

list = [10, 20, 30]

# Rule 1: Identity
# map(x, id) == x
identity_fn = fn x -> x end
IO.puts("Rule 1 (Identity): Does list == map(list, id)? #{list == Enum.map(list, identity_fn)}")

# Rule 2: Composition
# map(x, g . f) == map(map(x, f), g)
f = fn x -> x + 5 end
g = fn x -> x * 2 end

# Method A: Map f, then Map g
result_a = list |> Enum.map(f) |> Enum.map(g)

# Method B: Map g(f(x))
result_b = list |> Enum.map(fn x -> g.(f.(x)) end)

IO.puts("Rule 2 (Composition): Is A == B? #{result_a == result_b}")
IO.puts("Result: #{inspect(result_a)}")
