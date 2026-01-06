# 09. The Pipe Operator: The Assembly Line 管道

In many languages, if you want to perform multiple steps on some data, you end up with "Nested Code" that looks like this:
`bake(mix(crack(egg)))`

It's hard to read because you have to read it from the **inside out**.

In Elixir, we have the **Pipe Operator** `|>`. It is the most beloved feature of the language.

---

## 🧠 The Mental Model: The Assembly Line 🏭

Imagine an assembly line in a toy factory.
1. A piece of wood enters the line.
2. It goes to a **Cutter** (Step 1).
3. The cut wood goes to a **Painter** (Step 2).
4. The painted toy goes to a **Boxer** (Step 3).

In Elixir, the Pipe Operator `|>` takes the result of the thing on the left and "pipes" it as the **first argument** of the function on the right.

So instead of:
`box(paint(cut(wood)))`

We write:
`wood |> cut() |> paint() |> box()`

It reads left-to-right, just like a human!

## 🧩 New Concepts

- **Pipe Operator `|>`**: Passes the result of one expression as the first argument to the next function.
- **Data Flow**: Thinking about your program as data "flowing" through a series of transformations.

---

## 🧪 Working Code

Let's take a string, clean it up, capitalize it, and add a greeting.

```elixir
# filename: code/09.pipelines.exs

defmodule TextProcessor do
  def clean(text), do: String.trim(text)
  def shout(text), do: String.upcase(text)
  def add_greeting(text), do: "HELLO, " <> text
end

# The "Messy" Way (Inside-out)
dirty_name = "   rajesh   "
result1 = TextProcessor.add_greeting(TextProcessor.shout(TextProcessor.clean(dirty_name)))
IO.puts("Nested Result: #{result1}")

# The Elixir Way (The Pipeline)
result2 = 
  dirty_name
  |> TextProcessor.clean()
  |> TextProcessor.shout()
  |> TextProcessor.add_greeting()

IO.puts("Piped Result:  #{result2}")
```

## ▶️ How to Run

```bash
elixir code/09.pipelines.exs
```

## 📝 Expected Output

```text
Nested Result: HELLO, RAJESH
Piped Result:  HELLO, RAJESH
```

## 💡 Why This Matters

Pipelines make your code look like a story. You can see exactly what happens to the data at every step. This makes it incredibly easy for another engineer (or you, six months from now) to understand what the code is doing without having to untangle nested parentheses.
