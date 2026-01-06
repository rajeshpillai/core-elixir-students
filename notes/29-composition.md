# 29. Composition: The Chain Link Logic 🔗

The ultimate goal of functional programming is to take **small, simple things** and connect them to make **big, powerful things.** This is called **Composition**.

---

## 🧠 The Mental Model: The Chain Link ⛓️

Imagine you are a blacksmith. You don't build a 50-foot chain all at once.
- You forge one single, perfect **Link**. 
- You forge another perfect Link.
- You hook them together. 

Because each link is strong and fits the standard size, you can make a chain as long as you want. 

In Elixir:
- Each **Link** is a **Pure Function**.
- The **Hook** is the **Pipe Operator (`|>`)**.

## 🧩 Formal Definition

Mathematical composition says that if you have a function `f` and a function `g`, you can make a third function `h` where `h(x) = f(g(x))`. 

In Elixir, we write this as: `x |> g() |> f()`. 

---

## 🧪 Working Code

Let's build a text processor by composing 3 tiny links.

```elixir
# filename: code/29.composition.exs

defmodule TextProcessor do
  # Link 1: Clean
  def clean(text), do: String.trim(text)

  # Link 2: Shout
  def shout(text), do: String.upcase(text)

  # Link 3: Punctuate
  def add_points(text), do: text <> "!!!"

  # The Composition!
  def process(raw_text) do
    raw_text
    |> clean()
    |> shout()
    |> add_points()
  end
end

input = "   hello world   "
output = TextProcessor.process(input)

IO.puts("Input: '#{input}'")
IO.puts("Output: '#{output}'")
```

## ▶️ How to Run

```bash
elixir code/29.composition.exs
```

## 📝 Expected Output

```text
Input: '   hello world   '
Output: 'HELLO WORLD!!!'
```

## 💡 Why This Matters

When you compose functions, you don't need to keep a lot of information in your head. You only need to know that **Link A** produces exactly what **Link B** needs. This allows you to build massive systems (like a web server or a data pipeline) by just adding more links to the chain. 

If there is a bug, you don't look at the whole 50-foot chain. You test each link individually!
