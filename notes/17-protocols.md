# 17. Protocols: The Universal Remote Control 🎮

In Elixir, we have many different data types (Strings, Maps, Structs, Integers). But what if you want a single function to work for **all** of them, even if they behave differently?

This is where we use **Protocols**.

---

## 🧠 The Mental Model: The Universal Remote

Imagine you have a TV, a DVD player, and an Air Conditioner. 
- You want to turn them all "ON".
- But "ON" for a TV means showing a picture.
- "ON" for an AC means blowing cold air.

Instead of having 3 different remotes, you use a **Universal Remote**. You press the "Power" button, and the remote is smart enough to know: "If I'm pointing at the TV, do TV things. If I'm pointing at the AC, do AC things."

In Elixir, a **Protocol** is that "Universal Remote." You define the button (the function), and then you provide the instructions for each data type (the implementation).

## 🧩 New Concepts

- **Protocol**: A definition of a function that can be implemented for different types.
- **`defprotocol`**: Used to define the "button."
- **`defimpl`**: Used to define the "implementation" for a specific type.
- **Polymorphism**: A fancy word for "Many Shapes." It just means one function name taking many forms.

---

## 🧪 Working Code

Let's build a `Speaks` protocol. We want many things to be able to "speak" in their own way.

```elixir
# filename: code/17.protocols.exs

# 1. Define the Protocol (The 'Button')
defprotocol Speaks do
  def say_hello(data)
end

# 2. Implement for a String
defimpl Speaks, for: BitString do # BitString means String
  def say_hello(str), do: "A string says: '#{str}'"
end

# 3. Implement for an Integer
defimpl Speaks, for: Integer do
  def say_hello(num), do: "A number says: 'I am number #{num}!'"
end

# 4. Implement for a custom Struct
defmodule Robot do
  defstruct name: "Bot"
end

defimpl Speaks, for: Robot do
  def say_hello(robot), do: "Robot #{robot.name} says: 'BEEP BOOP!'"
end

# --- TESTING ---

# We can call 'Speaks.say_hello' on ANY of these things!
IO.puts(Speaks.say_hello("World"))
IO.puts(Speaks.say_hello(42))
IO.puts(Speaks.say_hello(%Robot{name: "Wall-E"}))
```

## ▶️ How to Run

```bash
elixir code/17.protocols.exs
```

## 📝 Expected Output

```text
A string says: 'World'
A number says: 'I am number 42!'
Robot Wall-E says: 'BEEP BOOP!'
```

## 💡 Why This Matters

Protocols are why Elixir is so flexible. For example, the `Enum` module (which we use for `map`, `filter`, etc.) uses the `Enumerable` protocol. This means as long as you implement `Enumerable` for your own custom data structure, you can use all of Elixir's powerful Enum tools on it automatically!
