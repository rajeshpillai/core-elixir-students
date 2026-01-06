# 10. Maps & Structs: The Data Organizers

We've learned about Lists and Tuples, but what if you want to store information that has "labels"? 
For example: a user with a `name`, an `email`, and an `age`.

In Elixir, we use **Maps** and **Structs**.

---

## 1. Maps `%{ }` (The Pocket Organizer) 📓
Imagine a notebook where you can write any label and any value next to it.
- **Strength**: You can add any tags you want on the fly.
- **Weakness**: There's no "master copy" to check if you made a typo (like typing `:nmae` instead of `:name`).
- **Syntax**: `%{name: "Rajesh", age: 30}`

## 2. Structs (The Order Form) 📝
Imagine a pre-printed form from a bank.
- **Strength**: It has specific boxes you *must* fill out. You can't just make up new boxes. This prevents bugs!
- **Weakness**: You have to define the form (the Module) before you can use it.
- **Requirement**: Structs are basically "Maps with a brand name."

---

## 🧠 The Mental Model: Labels vs. Forms

- Use a **Map** when you are dealing with random data (like a response from an API).
- Use a **Struct** when you are dealing with "Main Characters" in your app (like a `User`, a `Product`, or a `Post`).

## 🧩 New Concepts

- **Map `%{ }`**: A collection of key-value pairs.
- **Key**: The label (usually an atom).
- **Value**: The data stored under that label.
- **Struct**: A specialized map defined inside a module using `defstruct`.
- **Map Update `%{map | key: new_val}`**: A special syntax to "change" a value (remember: we're actually making a new map!). This only works if the key already exists.

---

## 🧪 Working Code

```elixir
# filename: code/10.maps_structs.exs

# --- 1. Working with Maps ---
user_map = %{name: "Alice", age: 25}

# Accessing values
IO.puts("1. Map Name: #{user_map.name}")

# Updating (Returns a NEW map!)
older_user = %{user_map | age: 26}
IO.puts("2. New Age: #{older_user.age}")


# --- 2. Working with Structs ---
defmodule User do
  # Define the "Order Form"
  defstruct name: "Unknown", age: 0, role: :member
end

# Create a new struct
user_struct = %User{name: "Bob", age: 30}

IO.puts("3. Struct User: #{user_struct.name} (Role: #{user_struct.role})")

# Structs catch typos!
# %User{nmae: "Error"} would fail to compile!
```

## ▶️ How to Run

```bash
elixir code/10.maps_structs.exs
```

## 📝 Expected Output

```text
1. Map Name: Alice
2. New Age: 26
3. Struct User: Bob (Role: member)
```

## 💡 Why This Matters

Maps and Structs are how you build a "Schema" for your data. In bigger Elixir apps (like those using Phoenix), Structs are used everywhere to make sure the data flowing through your system is correct and predictable. They are the skeleton of your application's data.
