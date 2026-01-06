# 30. Typespecs & Documentation: The Industry Contract ✍️

In a small project, you might remember that `add(x, y)` takes two numbers. But in a project with 100,000 lines of code, how do you know if `x` is a number, a string, or a complex map?

In Elixir, we use **Typespecs** and **Documentation** to build a professional contract between developers.

---

## 🧠 The Mental Model: The Blueprint Legend 🗺️

Imagine you are looking at a blueprint for a skyscraper.
- You see a symbol for a "Wall."
- Without a **Legend** (Documentation), you don't know if that wall is made of wood, glass, or steel.
- **Typespecs** are the legend. They tell the builder (and the computer) exactly what material each part must be made of.

## 🧩 New Concepts

- **`@doc`**: Documentation for humans. This powers the `h` command in IEx.
- **`@spec`**: Documentation for the computer. It specifies the input and output types.
- **`dialyzer`**: A tool that reads your `@spec` and warns you if you are passing the wrong "material" to a function.

---

## 🧪 Working Code

```elixir
# filename: code/30.typespecs.exs

defmodule Calculator do
  @moduledoc """
  A simple calculator to demonstrate Typespecs and Documentation.
  """

  @doc """
  Adds two integers together.
  
  ## Examples
      iex> Calculator.add(1, 2)
      3
  """
  @spec add(integer(), integer()) :: integer()
  def add(a, b) do
    a + b
  end

  @doc "Greets a user by name."
  @spec greet(String.t()) :: String.t()
  def greet(name) do
    "Hello, #{name}!"
  end
end

# Even without running dialyzer, this code is now self-documenting.
IO.puts(Calculator.greet("Rajesh"))
IO.puts("1 + 2 = #{Calculator.add(1, 2)}")
```

## ▶️ How to Run

```bash
elixir code/30.typespecs.exs
```

## 💡 Why This Matters

1.  **Safety**: Tools like `dialyzer` can find bugs before your code even runs by checking your `@spec`.
2.  **Communication**: When another developer uses your code, they can simply type `h YourModule.function` in their terminal and see exactly how to use it.
3.  **Professionalism**: No professional Elixir library is accepted by the community unless it has full Typespecs and Documentation. It is the mark of a Senior Engineer.
