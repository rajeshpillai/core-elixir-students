# 18. `Enum.reduce`: The Swiss Army Knife of Lists 🎒

We've used `Enum.map` to change every item in a list, and `Enum.filter` to throw some items away. 

But what if you want to take a whole list and turn it into **one single value**? For example:
- Summing a list of numbers into a total.
- Combining a list of words into a sentence.
- Counting how many of each fruit are in a list.

For this, we use the most powerful function in the Enum library: **`reduce`**.

---

## 🧠 The Mental Model: The Snowball ❄️

Imagine you are rolling a snowball down a hill.
1. You start with a **Tiny Seed** (an initial value, like `0`).
2. As you roll it over some **Snow** (the list of items), the snowball picks up the snow and gets bigger.
3. Every time it rolls over a piece of snow, you add that snow to your current snowball.
4. At the bottom of the hill, you have one **Giant Snowball** (the final result).

## 🧩 New Concepts

- **Accumulator (`acc`)**: This is your "Snowball." It stores the result of all the previous steps.
- **Initial Value**: The starting size of your snowball (e.g., `0` for sums, `""` for strings).
- **Reducer Function**: A function that takes **(current_item, accumulator)** and returns the **new_accumulator**.

---

## 🧪 Working Code

```elixir
# filename: code/18.reduce.exs

numbers = [1, 2, 3, 4, 10]

# --- 1. Summing numbers ---
# Initial value is 0. 
# For every number, we add it to the 'acc'.
sum = Enum.reduce(numbers, 0, fn number, acc -> 
  number + acc 
end)
IO.puts("1. The total sum is: #{sum}")

# --- 2. Building a sentence ---
words = ["Elixir", "is", "awesome"]
sentence = Enum.reduce(words, "", fn word, acc -> 
  acc <> " " <> word
end)
IO.puts("2. Sentence:#{sentence}")

# --- 3. Counting items (The Pro Level) ---
fruits = [:apple, :orange, :apple, :banana, :apple, :orange]

# We start with an empty map %{}
# For every fruit, we update its count in the map.
fruit_counts = Enum.reduce(fruits, %{}, fn fruit, acc ->
  # If the fruit isn't in the map, start at 1. Else, add 1.
  Map.update(acc, fruit, 1, fn count -> count + 1 end)
end)

IO.puts("3. Fruit counts: #{inspect(fruit_counts)}")
```

## ▶️ How to Run

```bash
elixir code/18.reduce.exs
```

## 📝 Expected Output

```text
1. The total sum is: 20
2. Sentence: Elixir is awesome
3. Fruit counts: %{apple: 3, banana: 1, orange: 2}
```

## 💡 Why This Matters

`reduce` is the foundation of functional programming. In fact, you can build `map`, `filter`, and almost every other list function using nothing but `reduce`. Mastering it means you can transform any pile of data into exactly the shape you need.
