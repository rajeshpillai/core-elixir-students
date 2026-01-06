# 07. Pattern Matching: The Elixir Superpower

In most languages, the `=` sign means "Assignment" (put this value into this variable).

In Elixir, the `=` sign is called the **Match Operator**. 

## 🧠 The Mental Model: The Balance Scale ⚖️

Imagine a balance scale.
- You put one thing on the left side and another thing on the right side.
- If the two sides look the same, the scale is balanced (success!). 
- If the left side has a "blank" variable name, Elixir "fills in the blank" to make the scale balance.

### Example 1: `x = 10`
- Right side: `10`
- Left side: `x` (blank)
- Result: Elixir says "To make this balance, I will make `x` equal `10`."

### Example 2: `[a, b] = [1, 2]`
- Right side: A list with `1` and `2`.
- Left side: A list with `a` and `b`.
- Result: Elixir says "`a` must be `1` and `b` must be `2` for this to match."

## 🧩 New Concepts

- **Match Operator (`=`)**: It doesn't just assign; it checks if two things "match."
- **Pin Operator (`^`)**: Use this when you want to use the *existing* value of a variable to check for a match, instead of re-binding it.
- **Error if No Match**: If you try to match `[a] = [1, 2, 3]`, Elixir will scream (throw a `MatchError`) because a list of 1 thing cannot be balanced with a list of 3 things.

---

## 🧪 Working Code

```elixir
# filename: code/07.pattern_matching.exs

# 1. Simple matching (looks like assignment)
x = 10
10 = x # This works because both sides are 10!
IO.puts("1. x is #{x}")

# 2. De-structuring (taking things apart)
{status, message} = {:ok, "Welcome aboard"}
IO.puts("2. Status: #{status}, Message: #{message}")

# 3. Matching with lists
[first, second | rest] = [1, 2, 3, 4, 5]
IO.puts("3. First: #{first}, Second: #{second}, Rest: #{inspect(rest)}")

# 4. The Pin Operator (checking against a value)
target = 10
# ^target = 20  # This would FAIL!
# To check if x is the 'target' value:
^target = x
IO.puts("4. Match successful! x equals the target value.")
```

## ▶️ How to Run

```bash
elixir code/07.pattern_matching.exs
```

## 📝 Expected Output

```text
1. x is 10
2. Status: ok, Message: Welcome aboard
3. First: 1, Second: 2, Rest: [3, 4, 5]
4. Match successful! x equals the target value.
```

## 💡 Why This Matters

Pattern matching allows us to write code that is incredibly easy to read. Instead of using `if status == :ok` and `message = data.msg`, we just say `{:ok, message} = data`. If it matches, we have the message. If not, we handle the error. It's safe, fast, and elegant.
