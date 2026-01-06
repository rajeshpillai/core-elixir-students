# 03. Variables & Immutability

In most programming languages, a variable is like a **Box**. You put a number in it, then later you can throw that number away and put a different number in the *same box*.

In Elixir, things are different. 

## 🧠 The Mental Model: The Photocopy Analogy

Imagine you have a piece of paper with the number `10` written on it. This is your variable `x`.

In Elixir, you **cannot** erase the number `10` and write `20`. Once it's on paper, it's there forever. This is called **Immutability**.

But what if you want `x` to be `20`? 
You take a *new* piece of paper, write `20` on it, and put the old paper in the shredder (or just ignore it). You "re-label" the new paper as `x`. 

### The "No-Touch" Rule for Functions
Imagine you give your "Alice" paper to a friend who is a "Capitalizer".
- In other languages, your friend might grab your paper and overwrite "Alice" with "ALICE".
- In Elixir, your friend **cannot** touch your paper. They must take a new paper, write "ALICE" on it, and hand it back to you. **Your original "Alice" paper stays exactly as it was.**

## 🧩 New Concepts

- **Immutability**: Once a value is created, it cannot be changed.
- **Assignment vs Binding**: In Elixir, we don't *assign* (like math `x = 10`), we *bind* the name to a value.
- **Garbage Collection**: When you stop using a piece of paper (like the "Alice" paper after you re-bind it to "Bob"), Elixir's "Janitor" (the Garbage Collector) automatically throws it away for you to save space.
- **_ (Underscore)**: If you have a variable you aren't going to use, you start its name with an `_` (like `_ignored`). This tells Elixir "I know I have this, but I don't need it right now."

## 🧪 Working Code

Let's see this in action. Create a file called `code/03.variables.exs`.

```elixir
# filename: code/03.variables.exs

name = "Alice"
IO.puts("1. Initial name: " <> name)

# 2. Re-binding
name = "Bob"
IO.puts("2. After re-binding: " <> name)

# 3. The Big Test: Functions
# Let's try to 'UPPERCASE' Bob.
String.upcase(name)

# Did Bob change to "BOB"?
IO.puts("3. Did 'name' change? " <> name) 

# NO! String.upcase returned a NEW string, but we didn't save it.
# To get the uppercase version, we have to re-bind it:
loud_name = String.upcase(name)
IO.puts("4. New variable 'loud_name': " <> loud_name)
IO.puts("5. Original 'name' is STILL: " <> name)
```

## ▶️ How to Run

```bash
elixir code/03.variables.exs
```

## 📝 Expected Output

```text
Hello, Alice
Now the name is: Bob
```

## 💡 Why This Matters

Imagine you're building a multiplayer game. If two players try to change the same "Health Bar" at the same exact microsecond, it can cause a "Race Condition" (a bug that is super hard to find).

In Elixir, because data can't change, we never have that problem! We just create new versions of the health bar. It makes Elixir the "King of Concurrency" (running many things at once).
