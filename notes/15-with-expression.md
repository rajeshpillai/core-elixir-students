# 15. The `with` Expression: Managing the Happy Path 🛤️

As an intermediate developer, you'll start dealing with real-world problems where many things can go wrong at once.

Imagine you're trying to let a user buy a movie ticket. You need to:
1. Find the User.
2. Check if they have enough money.
3. Check if the movie has seats.

In other languages, this leads to **"If-Hell"** (5 levels of nested `if` statements). In Elixir, we use **`with`**.

---

## 🧠 The Mental Model: The Security Checkpoint 🛂

Imagine you are trying to enter a VIP club. There are 3 guards:
1. **Guard 1**: Checks your ID.
2. **Guard 2**: Checks your Dress Code.
3. **Guard 3**: Checks your Ticket.

In **"If-Hell"**, you talk to Guard 1, if he lets you through, you talk to Guard 2... it's exhausting to read.

With **`with`**, you create a "Happy Path":
"I enter IF my ID is valid, AND IF my clothes are nice, AND IF I have a ticket."
**If ANY guard stops you, you are immediately sent back to the entrance with a specific reason why.**

## 🧩 New Concepts

- **`with`**: A chain of pattern matches.
- **The Happy Path**: The sequence of events when everything goes right.
- **Else Block**: A place to handle *any* part of the chain that fails.

---

## 🧪 Working Code

```elixir
# filename: code/15.with_expression.exs

defmodule TicketSystem do
  def find_user(id) when id == 1, do: {:ok, %{name: "Rajesh", balance: 50}}
  def find_user(_id), do: {:error, :user_not_found}

  def check_balance(user, price) do
    if user.balance >= price, do: :ok, else: {:error, :insufficient_funds}
  end

  def buy_ticket(user_id, price) do
    # This is the 'with' expression. It reads left to right.
    with {:ok, user} <- find_user(user_id),
         :ok <- check_balance(user, price) 
    do
      # This block ONLY runs if EVERY line above matched!
      "Success! Enjoy the movie, #{user.name}."
    else
      # If ANY line didn't match, the error "falls" down here.
      {:error, :user_not_found} -> "We couldn't find that person."
      {:error, :insufficient_funds} -> "You need more money!"
    end
  end
end

IO.puts("1. Buying $20 ticket: " <> TicketSystem.buy_ticket(1, 20))
IO.puts("2. Buying $100 ticket: " <> TicketSystem.buy_ticket(1, 100))
IO.puts("3. Buying for missing user: " <> TicketSystem.buy_ticket(99, 20))
```

## ▶️ How to Run

```bash
elixir code/15.with_expression.exs
```

## 📝 Expected Output

```text
1. Buying $20 ticket: Success! Enjoy the movie, Rajesh.
2. Buying $100 ticket: You need more money!
3. Buying for missing user: We couldn't find that person.
```

## 💡 Why This Matters

`with` allows you to focus on the "Happy Path" (the success story) while keeping all your error handling in one easy-to-read `else` block. This is the difference between messy "beginner" code and clean "intermediate" professional code.
