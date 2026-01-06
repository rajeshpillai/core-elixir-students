# 20. Metaprogramming: The Code that Writes Code 🪄

Elixir is a very "small" language. Many things you think are built-in (like `if`, `unless`, and even `def`) are actually written in Elixir itself! 

This is possible because of **Metaprogramming** using **Macros**.

---

## 🧠 The Mental Model: The Rubber Stamp

Imagine you have to write "CONFIDENTIAL" on 1,000 papers.
- You could write it by hand (Beginner).
- You could create a **Rubber Stamp** that says "CONFIDENTIAL" (Macro).

A Macro doesn't run when your program is "running." It runs when your program is **compiling**. It takes your code and "stamps" it with more code before sending it to the computer. 

### The Secret Life of Elixir Code: The AST
In Elixir, your code is actually just a big List. 
- You write: `1 + 2`
- Elixir sees: `{:+, [context], [1, 2]}`
- Because code is just a list, Elixir can **edit** your code before it runs!

## 🧩 New Concepts

- **AST (Abstract Syntax Tree)**: The list representation of your code.
- **`quote`**: Converts code into its AST form (the list).
- **`unquote`**: Injects a value back into the AST.
- **`defmacro`**: Defines a macro.

---

## 🧪 Working Code

Let's build an `unless` macro (even though Elixir already has one!).

```elixir
# filename: code/20.macros.exs

defmodule MyMacros do
  # A macro takes code as input and returns code as output.
  defmacro say_unless(condition, do: block) do
    quote do
      # This code will be "stamped" into the caller's module
      if !unquote(condition) do
        unquote(block)
      end
    end
  end
end

# To use a macro, we must 'require' it.
defmodule Test do
  require MyMacros

  def run do
    MyMacros.say_unless 1 + 1 == 3 do
      IO.puts("The math is wrong, as expected!")
    end
  end
end

Test.run()
```

## ▶️ How to Run

```bash
elixir code/20.macros.exs
```

## 📝 Expected Output

```text
The math is wrong, as expected!
```

## 💡 Why This Matters

Macros are what make Elixir feel like a "Personal Language." Libraries like **Phoenix** and **Ecto** use macros to create beautiful, readable code that looks like magic, but is actually just Elixir generating more Elixir behind the scenes. **Use them sparingly!** Overusing macros makes code hard to debug.
