# 19. Behaviours: The Industry Contract 📋

When you're working on a big project with many developers, you need a way to make sure everyone is following the same rules.

In Elixir, we use **Behaviours**.

---

## 🧠 The Mental Model: The Architect's Blueprint

Imagine an architect is designing a street with many different houses.
They don't know exactly what color the walls will be or what furniture is inside. But they force every builder to follow a **Blueprint**:
- Every house MUST have a `front_door`.
- Every house MUST have a `roof`.
- Every house MUST have `windows`.

The architect doesn't build the house; they just provide the **Rules**.

In Elixir, a **Behaviour** defines a set of functions that a module **must** implement. If you "sign the contract" (using `@behaviour`), Elixir will warn you if you forget one of the functions!

## 🧩 New Concepts

- **Behaviour**: A set of required functions (callbacks).
- **`@callback`**: Used to define what the required function looks like (the "Contract").
- **`@behaviour`**: Used when a module wants to follow those rules.
- **`@impl true`**: A tag you put above a function to say "I am implementing a rule from a behaviour."

---

## 🧪 Working Code

Let's build a `PaymentProcessor` behaviour. Every payment method (CreditCard, PayPal) must follow its rules.

```elixir
# filename: code/19.behaviours.exs

# 1. Define the CONTRACT (The Blueprint)
defmodule PaymentProcessor do
  # This says: Any module that is a PaymentProcessor 
  # must have a function called 'pay' that takes an amount.
  @callback pay(amount :: integer) :: {:ok, String.t()} | {:error, String.t()}
end

# 2. Implement the contract for Credit Card
defmodule CreditCard do
  @behaviour PaymentProcessor

  @impl true
  def pay(amount) do
    IO.puts("Charging $#{amount} to Credit Card...")
    {:ok, "Success"}
  end
end

# 3. Implement the contract for PayPal
defmodule PayPal do
  @behaviour PaymentProcessor

  @impl true
  def pay(amount) do
    IO.puts("Redirecting to PayPal for $#{amount}...")
    {:ok, "Success"}
  end
end

# --- TESTING ---
defmodule Checkout do
  # This function doesn't care IF it's a credit card or PayPal.
  # It just knows that whatever it is, it MUST have a 'pay' function!
  def process(amount, strategy) do
    strategy.pay(amount)
  end
end

Checkout.process(100, CreditCard)
Checkout.process(200, PayPal)
```

## ▶️ How to Run

```bash
elixir code/19.behaviours.exs
```

## 📝 Expected Output

```text
Charging $100 to Credit Card...
Redirecting to PayPal for $200...
```

## 💡 Why This Matters

Behaviours are the secret behind Elixir's most powerful libraries. For example, `GenServer` (which we learned in Lesson 12) is a Behaviour! When you say `use GenServer`, you are signing a contract to implement functions like `handle_call` and `handle_cast`. It's how Elixir enforces standard patterns across millions of lines of code.
