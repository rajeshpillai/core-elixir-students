# 12. GenServer: The Expert Store Clerk 🏪

In the last lesson, we saw that processes are like independent workers. But there was a problem: **workers die after one task** unless they call themselves again (recursion).

Writing that recursion yourself every time is hard and easy to mess up. So, Elixir gives us a "Template" or a "Super Worker" called a **GenServer** (Generic Server).

---

## 🧠 The Mental Model: The Store Clerk with a Clipboard

Imagine a store clerk standing behind a counter. They have a **Clipboard** (this is their **State** or memory).

They can handle two kinds of requests:

1. **"Call" (Synchronous)**: You ask a question and **wait** for an answer.
   - *Example*: "What is the current count?" 
   - *Result*: The clerk checks the clipboard and tells you. You can't leave until they answer.

2. **"Cast" (Asynchronous)**: You give an order and **walk away**.
   - *Example*: "Add 1 to the count."
   - *Result*: The clerk says "Got it!", and you walk away immediately. They update the clipboard whenever they have a second.

## 🧩 New Concepts

- **GenServer**: A behavior (template) for building processes that keep state.
- **State**: The data the GenServer "remembers" (like the count on the clipboard).
- **`init`**: Setting up the "Clipboard" for the first time when the clerk starts.
- **`handle_call`**: Handling requests where the sender is waiting for a reply.
- **`handle_cast`**: Handling requests where the sender doesn't need a reply.
- **`start_link`**: Starting the worker and linking it to the system.

---

## 🧪 Working Code

Let's build a simple **Counter** clerk.

```elixir
# filename: code/12.genserver.exs

defmodule CounterClerk do
  use GenServer # This tells Elixir: "Make this module a GenServer"

  # --- Client API (The buttons you press) ---

  def start_link(initial_count) do
    # This starts the clerk
    GenServer.start_link(__MODULE__, initial_count, name: :my_counter)
  end

  def get_count() do
    # This is a CALL (we wait for the answer)
    GenServer.call(:my_counter, :get)
  end

  def increment() do
    # This is a CAST (we don't wait)
    GenServer.cast(:my_counter, :inc)
  end

  # --- Server Callbacks (What the clerk actually does) ---

  @impl true
  def init(count) do
    # Opening the store with an initial clipboard value
    IO.puts("Clerk: Store open! Initial count is #{count}.")
    {:ok, count}
  end

  @impl true
  def handle_call(:get, _from, current_count) do
    # Someone asked for the count. We reply with the count and KEEP the count.
    {:reply, current_count, current_count}
  end

  @impl true
  def handle_cast(:inc, current_count) do
    # Someone said 'plus one'. We update our clipboard.
    new_count = current_count + 1
    IO.puts("Clerk: Incrementing... (New: #{new_count})")
    {:noreply, new_count}
  end
end

# Let's test it!
CounterClerk.start_link(10)

IO.puts("User: The current count is #{CounterClerk.get_count()}")

CounterClerk.increment()
CounterClerk.increment()

IO.puts("User: Now the count is #{CounterClerk.get_count()}")

```

## ▶️ How to Run

```bash
elixir code/12.genserver.exs
```

## 📝 Expected Output

```text
Clerk: Store open! Initial count is 10.
User: The current count is 10
Clerk: Incrementing... (New: 11)
Clerk: Incrementing... (New: 12)
User: Now the count is 12
```

## 💡 Why This Matters

GenServers are the "Workhorses" of Elixir. Almost everything in a real Elixir app—from handling database connections to managing user sessions—is built using GenServers. They provide a safe, standardized way to handle **State** without ever breaking the rule of **Immutability**, because the state only "changes" inside the clerk's private room.
