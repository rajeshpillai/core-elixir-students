# 05. Data Types: Numbers, Strings, & Atoms

Before we start building big things, we need to know the basic "materials" we have in Elixir.

## 1. Numbers 🔢
Elixir handle numbers like a pro.
- **Integers**: Whole numbers like `1`, `42`, `-500`.
- **Floats**: Decimal numbers like `3.14`, `0.5`, `1.0`.

## 2. Strings 🧵
Strings are just bits of text. In Elixir, they **must** be wrapped in double quotes `" "`.
- Example: `"Hello World!"`
- You can join them with `<>`: `"Hi " <> "Rajesh"` becomes `"Hi Rajesh"`.
- You can inject variables using `#{ }`: `"Sum is #{1 + 1}"` becomes `"Sum is 2"`.

## 3. Atoms 🏷️
This is a special Elixir thing! 
**Atoms are names whose value is their own name.** They always start with a colon `:`.

### 🧠 Mental Model: The Sticky Note Labels
Imagine you have a bunch of boxes. You don't care what's inside them yet, you just want to label them.
- You take a sticky note, write `:ok` on it, and stick it on a successful task.
- You take another sticky note, write `:error` on it, and stick it on a failed task.
- You don't need to change what `:ok` means. It just means `:ok`.

In other languages, people use strings like `"SUCCESS"`, but strings are heavy and slow. Atoms are tiny, lightning-fast, and very useful for status updates.

## 🧩 New Concepts

- **Integer**: Whole number.
- **Float**: Decimal number.
- **String**: Text.
- **Atom**: A constant whose name is its value (e.g., `:apple`, `:ready`, `:ok`).
- **Interpolation**: Using `#{ }` to put code results inside a string.

## 🧪 Working Code

```elixir
# filename: code/05.data_types.exs

# Numbers
integer = 100
float = 3.14
IO.puts("Number math: #{integer + float}")

# Strings
greeting = "Hello"
name = "Elixir Learner"
IO.puts(greeting <> ", " <> name <> "!")

# Atoms
status = :ok
error_code = :not_found

IO.puts("The status is: #{status}")
IO.puts("Is it ok? #{status == :ok}")
```

## ▶️ How to Run

```bash
elixir code/05.data_types.exs
```

## 📝 Expected Output

```text
Number math: 103.14
Hello, Elixir Learner!
The status is: ok
Is it ok? true
```

## 💡 Why This Matters

Atoms are everywhere in Elixir. When we start learning about **Pattern Matching** and **Processes**, atoms will be the main way we "talk" between different parts of our program. They are the "signs" and "messages" of the Elixir world.
