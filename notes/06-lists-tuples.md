# 06. Containers: Lists & Tuples

Now that we know our basic data types (Numbers, Strings, Atoms), let's look at how we group them together.

In Elixir, we have two main "containers." They might look similar, but they behave very differently!

## 1. Lists `[ ]` (The Train) 🚂
Imagine a train. Each car is linked to the next one.
- **Strength**: It's very easy to add a new car to the *front* of the train.
- **Weakness**: If you want to find the last car, you have to walk through the whole train from the front.
- **Syntax**: `[1, 2, 3, :ok, "hello"]`

## 2. Tuples `{ }` (The Egg Carton) 🥚
Imagine a carton of eggs. It has a fixed size (like 6 or 12).
- **Strength**: You can reach out and grab the 5th egg instantly without counting from the start.
- **Weakness**: If you want to add a new egg slot, you have to throw away the whole carton and get a new, bigger one.
- **Syntax**: `{:ok, "Success!"}` or `{1, 2, 3}`

---

### 🧠 The Mental Model: When to use which?

- Use a **List** when you have a bunch of things that might grow or shrink (like a grocery list).
- Use a **Tuple** when you want to group a specific set of information together (like a "Response" from a waiter: `{:ok, "Here is your pizza"}`).

## 🧩 New Concepts

- **List `[ ]`**: A collection that is fast to grow at the front.
- **Tuple `{ }`**: A collection that is fast to access by index (position), but slow to grow.
- **HEAD and TAIL**: The first element of a list is the `hd` (head), and the rest of the list is the `tl` (tail).
- **Cons Operator `|`**: A special tool to stick things to the front of a list: `[new_item | existing_list]`.

## 🧪 Working Code

```elixir
# filename: code/06.lists_tuples.exs

# --- LISTS ---
shoppings = ["Apples", "Milk", "Eggs"]

# Sticking something to the front (Fast!)
new_shoppings = ["Bread" | shoppings]
IO.puts("1. My list: #{inspect(new_shoppings)}")

# Getting the Head (first item) and Tail (rest)
[head | tail] = new_shoppings
IO.puts("2. Head: #{head}")
IO.puts("3. Tail: #{inspect(tail)}")

# --- TUPLES ---
# We often use tuples to show "Status"
result = {:ok, "Download finished"}
IO.puts("4. Result Tuple: #{inspect(result)}")

# Accessing by index (0-based)
status = elem(result, 0)
message = elem(result, 1)
IO.puts("5. Status is #{status} and message is: #{message}")
```

## ▶️ How to Run

```bash
elixir code/06.lists_tuples.exs
```

## 📝 Expected Output

```text
1. My list: ["Bread", "Apples", "Milk", "Eggs"]
2. Head: Bread
3. Tail: ["Apples", "Milk", "Eggs"]
4. Result Tuple: {:ok, "Download finished"}
5. Status is ok and message is: Download finished
```

## 💡 Why This Matters

This is where the magic of Elixir begins. By splitting lists into `[head | tail]`, we can use **Recursion** (a function calling itself) to process big piles of data one item at a time. This is the "Elixir way" of doing things instead of using "Loops" like `for` or `while`.
