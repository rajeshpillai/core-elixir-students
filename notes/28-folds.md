# 28. Folds: The Origami Model ❄️

We've already used `Enum.reduce/3`. In computer science theory, this is called a **Fold**. 

If a **Functor** is about changing values inside a box, a **Fold** is about **collapsing** the box into a single value.

---

## 🧠 The Mental Model: Origami 🦢

Imagine a large, flat sheet of paper (A List or Map).
- You want to turn this flat sheet into a small paper crane (A single value).
- You start at one corner and begin **folding** the paper over itself, again and again.
- Each fold takes the "current shape" and "new data" and merges them.
- In the end, the large structure is gone, and you only have the result.

## 🧩 New Concepts

- **Folding Left (`foldl`)**: Starting from the beginning of the list (common in Elixir).
- **Catamorphism**: The math name for "collapsing" a data structure.
- **The Acculumator**: The "Paper Crane" as it's being folded.

---

## 🧪 Working Code

Let's look at how `reduce` is the foundation of almost everything.

```elixir
# filename: code/28.folds.exs

# 1. Collasping a list into a sum
data = [1, 2, 3, 4]
sum = Enum.reduce(data, 0, fn x, acc -> x + acc end)
IO.puts("Folded to Sum: #{sum}")

# 2. Re-implementing 'Map' using a Fold!
# This proves that Fold is more powerful than Map.
mapped = Enum.reduce(data, [], fn x, acc -> acc ++ [x * 10] end)
IO.puts("Re-made Map using Fold: #{inspect(mapped)}")

# 3. Aggregating into a Map
characters = ["A", "B", "A", "C", "B", "A"]
counts = Enum.reduce(characters, %{}, fn char, acc -> 
  Map.update(acc, char, 1, fn current -> current + 1 end)
end)
IO.puts("Frequency Fold: #{inspect(counts)}")
```

## ▶️ How to Run

```bash
elixir code/28.folds.exs
```

## 💡 Why This Matters

90% of data processing in functional programming is just **folding**. Whether you are summing numbers, filtering a database result, or building a complex HTML report, you are essentially "folding" a stream of data into a final structure. Once you master the Fold, you can build any other function (like `filter`, `find`, or `map`) from scratch!
