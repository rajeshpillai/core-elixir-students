# 27. Functors: The Art of Mapping 🎁

A **Functor** is a scary word for something you already do every day in Elixir: **Using `Enum.map`!**

But a Functor isn't just for Lists. It's a general rule for any "Container."

---

## 🧠 The Mental Model: The Gift Wrap 🎁

Imagine you have a **Box** (A Container). Inside the box is a **Toy**.
- You want to change the toy (e.g., paint it blue), but you don't want to break the box.
- You send a "Magic Wand" into the box that changes the toy and then leaves.
- The box stays exactly the same, but the inside is different.

**A Functor is just any data structure that lets you use a "Magic Wand" (a function) to change the value inside it.**

## 🧩 The Rules

To be a proper Functor, the container must follow two rules:
1. **Preserve Identity**: If you map the "Identity" function (a function that does nothing), the box must stay exactly the same.
2. **Composition**: If you map two functions one after another, it must be the same as mapping one big function that combines them.

---

## 🧪 Working Code

In Elixir, `Enum.map` is the Functor implementation for Enumerable types.

```elixir
# filename: code/27.functors.exs

# 1. The classic Functor (The List)
numbers = [1, 2, 3]

# The "Map" function is how we treat it as a Functor
plus_ten = Enum.map(numbers, fn x -> x + 10 end)
IO.puts("Mapped List: #{inspect(plus_ten)}")

# 2. Preserving Identity (Rule 1)
same_numbers = Enum.map(numbers, fn x -> x end)
IO.puts("Identity Rule: #{numbers == same_numbers}")

# 3. Composition (Rule 2)
# Map f then g...
f = fn x -> x * 2 end
g = fn x -> x + 1 end

res1 = numbers |> Enum.map(f) |> Enum.map(g)
# ...is the same as mapping (g of f)
res2 = numbers |> Enum.map(fn x -> g.(f.(x)) end)

IO.puts("Composition Rule: #{res1 == res2}")
```

## ▶️ How to Run

```bash
elixir code/27.functors.exs
```

## 💡 Why This Matters

Thinking in Functors allows you to reason about your code at a higher level. Instead of worrying about *how* to loop through data, you focus on the *transformation* of the value inside the container. This makes your code cleaner and more predictable. 

**Wait, what about Errors?** In advanced FP, there is a special "Box" called an `Option` or `Either` that handles errors. In Elixir, we often use `with` or `case` for this, but the "Mapping" logic remains the same!
