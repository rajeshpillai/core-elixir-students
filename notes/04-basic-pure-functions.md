# 04. Basic & Pure Functions

In Elixir, we don't just write loose code. We organize our code into **Modules** (groups of functions) and **Functions** (specific tasks).

## 🧠 The Mental Model: The Recipe vs. The Robot Arm

### The Pure Function (The Recipe)
Imagine a recipe for a cake.
- **Input**: 2 Eggs, 1 cup Flour.
- **Process**: Mix and bake.
- **Output**: 1 Cake.
- **Rule**: If you follow this recipe exactly, you get the *same* cake every single time. It doesn't matter if it's raining outside or if the president of the world just changed. This is a **Pure Function**.

### The Impure Function (The Robot Arm)
Imagine a robot arm that reaches out and grabs a random toy from a box.
- Every time you press the button, you might get a different toy. 
- It "reaches out" and touches the world.
- This is an **Impure Function** (or a function with "Side Effects").

In Elixir, we *love* Pure Functions. They make our code predictable and easy to test.

## 🧩 New Concepts

- **Module**: A container for functions. In Elixir, we start modules with `defmodule`.
- **Function**: A specific set of instructions. We define them with `def`.
- **Pure Function**: For the same input, it ALWAYS gives the same output. It never "reaches out" to change something else.
- **Returning Values**: In Elixir, the **last line** of a function is what it "returns" (gives back). You don't need a `return` keyword!

## 🧪 Working Code

Let's build a math module.

```elixir
# filename: code/04.functions.exs

defmodule MyMath do
  # This is a PURE function. 
  # It only uses 'a' and 'b' to give a result.
  def add(a, b) do
    a + b
  end

  def double(number) do
    number * 2
  end
end

# To use it, we type ModuleName.function_name
result1 = MyMath.add(5, 10)
IO.puts("1. Adding 5 + 10 = #{result1}")

result2 = MyMath.double(result1)
IO.puts("2. Doubling that result = #{result2}")
```

## ▶️ How to Run

```bash
elixir code/04.functions.exs
```

## 📝 Expected Output

```text
1. Adding 5 + 10 = 15
2. Doubling that result = 30
```

## 💡 Why This Matters

Pure functions are the "LEGO bricks" of Elixir. Because they never change things secretly, you can test them easily. If `MyMath.add(2, 2)` works once, it will work forever. This makes debugging a dream instead of a nightmare!
