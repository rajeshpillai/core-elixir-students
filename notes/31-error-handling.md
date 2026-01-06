# 31. Error Handling: The Safety Net 🛡️

In Elixir, we say "Let it Crash." But what about errors we *expect* to happen? 
- A user uploads a file that is too big.
- You try to divide by zero.
- A database query fails because of a typo.

We need to know when to "Let it Crash" and when to use a **Safety Net**.

---

## 🧠 The Mental Model: The Acrobat & The Safety Net 🎪

### 1. The Acrobat (Let it Crash)
If an acrobat is performing a dangerous stunt and something goes fundamentally wrong (the rope breaks), we just let them fall and have a **Supervisor** replace them with a fresh acrobat. This is for **unrecoverable** errors.

### 2. The Safety Net (Expected Errors)
If the acrobat knows they might slip on a specific move, they put a **Safety Net** (`try/rescue`) underneath. This is for errors they **know** might happen and they want to catch them and keep going *without* dying.

## 🧩 The Two Ways to Handle Errors

1.  **Tagging (The Elixir Way)**: Returning `{:ok, value}` or `{:error, reason}`. This is the most common and "Functional" way.
2.  **Rescue (The Emergency Way)**: Using `try...rescue`. This is used for "Exceptions" that would normally crash the process.

---

## 🧪 Working Code

```elixir
# filename: code/31.error_handling.exs

defmodule SafeMath do
  # 1. The Tagged Version (Recommended)
  def divide_tagged(a, b) do
    if b == 0 do
      {:error, "Cannot divide by zero!"}
    else
      {:ok, a / b}
    end
  end

  # 2. The Rescue Version (For emergencies)
  def divide_rescue(a, b) do
    try do
      a / b
    rescue
      e in ArithmeticError -> "Caught a math error: #{e.message}"
    end
  end
end

# Testing Tagged
case SafeMath.divide_tagged(10, 0) do
  {:ok, result} -> IO.puts("Result: #{result}")
  {:error, msg} -> IO.puts("Error Tag: #{msg}")
end

# Testing Rescue
IO.puts("Rescue Attempt: #{SafeMath.divide_rescue(10, 0)}")
```

## ▶️ How to Run

```bash
elixir code/31.error_handling.exs
```

## 💡 Why This Matters

99% of the time, Elixir developers use **Tagged Returns** (`{:ok, ...}`). Why? Because it makes the error part of the data flow. You can use **Pattern Matching** to handle the error easily. Only use `try/rescue` for things you truly cannot prevent, like a library throwing an unexpected exception.
