# 08. Recursion: The Loop without a Loop

In most programming languages, if you want to do something 10 times, you use a `for` or `while` loop. 

In Elixir, remember the **No-Touch Rule** (Immutability)? Because we can't change a "counter" variable (like `i = i + 1`), we can't use traditional loops.

Instead, we use **Recursion**.

---

## 🧠 The Mental Model: Russian Nesting Dolls 🪆

Imagine you want to find a tiny piece of candy inside a set of Russian Nesting Dolls.
1. You look at the doll in your hand.
2. **Base Case**: Is it the tiniest doll? If yes, open it and find the candy (Stop!).
3. **Recursive Step**: If no, open it, put the bigger shell aside, and repeat the process with the *smaller* doll inside.

In Elixir, a function "calls itself" with a smaller version of the problem until it hits the smallest possible version (the Base Case).

## 🧩 New Concepts

- **Recursion**: When a function calls itself.
- **Base Case**: The condition that tells the function to stop (essential, or you'll loop forever!).
- **Recursive Step**: The part where the function calls itself with a slightly different (usually smaller) input.
- **Tail Call Optimization (TCO)**: A fancy BEAM trick that makes recursion just as fast and memory-efficient as a loop.

---

## 🧪 Working Code

Let's build a countdown timer and a tool to sum up a list of numbers.

```elixir
# filename: code/08.recursion.exs

defmodule FunWithRecursion do
  # --- 1. Countdown ---
  
  # Base Case: If we hit 0, we stop and say "Blast off!"
  def countdown(0) do
    IO.puts("0... Blast off! 🚀")
  end

  # Recursive Step: Print the number, then call countdown with number - 1
  def countdown(n) do
    IO.puts("#{n}...")
    countdown(n - 1)
  end

  # --- 2. Summing a List ---

  # Base Case: The sum of an empty list is 0.
  def sum_list([]) do
    0
  end

  # Recursive Step: Take the head, and add it to the sum of the tail.
  def sum_list([head | tail]) do
    head + sum_list(tail)
  end
end

FunWithRecursion.countdown(3)

numbers = [1, 2, 3, 4, 5]
total = FunWithRecursion.sum_list(numbers)
IO.puts("The sum of #{inspect(numbers)} is #{total}")
```

## ▶️ How to Run

```bash
elixir code/08.recursion.exs
```

## 📝 Expected Output

```text
3...
2...
1...
0... Blast off! 🚀
The sum of [1, 2, 3, 4, 5] is 15
```

## 💡 Why This Matters

Recursion is how Elixir handles data of unknown size. Whether you have 10 users or 10 million, recursion (combined with the BEAM's efficiency) allows you to process them reliably without ever needing to "mutate" a single variable. It's the ultimate functional tool!
