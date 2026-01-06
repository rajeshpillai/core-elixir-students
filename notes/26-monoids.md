# 26. Monoids: The Laws of Combination 🧱

In functional programming, you'll often hear the word **"Monoid"**. It sounds like a species of alien, but it's actually just a set of rules for combining things.

---

## 🧠 The Mental Model: The LEGO Brick 🧱

Imagine you have a bucket of LEGO bricks. For them to be a "Monoid," they must follow 3 simple rules:

1.  **Rule of Combination (Closure)**: If you click two LEGO bricks together, you still have a LEGO structure. You don't suddenly end up with a banana. (Combining two things of type A gives you another thing of type A).
2.  **Rule of Identity (The Empty Brick)**: There must be an "Empty" element that does nothing. If you add it to a brick, the brick stays exactly the same.
3.  **Rule of Grouping (Associativity)**: It doesn't matter if you click brick A and B together first, or B and C first. The final tower looks the same.

## 🧩 Why does this matter?

If your data follows these rules, your code becomes **parallelizable**. You can have 100 computers working on tiny parts of the calculation simultaneously, and you know they will combine perfectly at the end!

---

## 🧪 Working Code

Let's see two common Monoids in Elixir: **Integers** and **Lists**.

```elixir
# filename: code/26.monoids.exs

defmodule MonoidDemo do
  # --- 1. The Integer Addition Monoid ---
  # Combination: +
  # Identity: 0
  def sum(list) do
    # 0 is the 'Identity' because x + 0 = x
    Enum.reduce(list, 0, fn x, acc -> x + acc end)
  end

  # --- 2. The String Monoid ---
  # Combination: <>
  # Identity: ""
  def join(list) do
    # "" is the 'Identity' because "hi" <> "" = "hi"
    Enum.reduce(list, "", fn x, acc -> acc <> x end)
  end
end

IO.puts("Sum Monoid: #{MonoidDemo.sum([1, 2, 3])}")
IO.puts("String Monoid: #{MonoidDemo.join(["Elixir", " ", "is", " ", "Fun"])}")
```

## ▶️ How to Run

```bash
elixir code/26.monoids.exs
```

## 📝 Expected Output

```text
Sum Monoid: 6
String Monoid: Elixir is Fun
```

## 💡 Summary

A Monoid is just a **DataType** + a **way to combine them** + an **Empty version**. 
When you see a `reduce` function with an initial value, you are looking at a Monoid in action!
