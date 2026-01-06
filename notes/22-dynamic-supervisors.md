# 22. Dynamic Supervisors: Scaling on Demand 📈

In the previous lesson, we learned about **Supervisors** that start a fixed list of workers. But what if you don't know how many workers you need until the app is running? 

For example:
- You need a new process for every user who joins a chat.
- You need a process for every file being uploaded.
- You need a process for every active game match.

For this, we use the **Dynamic Supervisor**.

---

## 🧠 The Mental Model: The On-Call Manager 📞

Imagine a regular Supervisor as a **Shift Manager**. They have a fixed list of workers (Rajesh, Alice, Bob). If one doesn't show up, they call them back.

A **Dynamic Supervisor** is like an **On-Call Manager** at a temp agency. 
- They start the day with **zero** workers.
- Every time a new "Job" comes in, they "Spawn" a new worker specifically for that job.
- When the job is done, the worker leaves.
- If a temporary worker crashes *while* doing their job, the On-Call Manager handles the restart rules just like a normal supervisor.

## 🧩 New Concepts

- **Static Supervisor**: Starts a fixed list of children at boot time.
- **Dynamic Supervisor**: Starts with no children and allows you to add children whenever you want.
- **`start_child`**: The command to tell the manager "Hey, hire a new worker for this task."

---

## 🧪 Working Code

```elixir
# filename: code/22.dynamic_supervisors.exs

# 1. A simple worker that represents a "User Session"
defmodule UserSession do
  use GenServer

  def start_link(user_name) do
    GenServer.start_link(__MODULE__, user_name)
  end

  def init(user_name) do
    IO.puts("--- [SYSTEM] Starting session for #{user_name}")
    {:ok, user_name}
  end
end

# 2. Start the Dynamic Supervisor
# We name it 'MyDynamicSup' so we can talk to it easily.
{:ok, sup_pid} = DynamicSupervisor.start_link(
  strategy: :one_for_one, 
  name: MyDynamicSup
)

# 3. Hiring workers ON DEMAND
IO.puts("App: Letting users in...")

# We tell the supervisor: "Start a UserSession worker with the name 'Alice'"
DynamicSupervisor.start_child(MyDynamicSup, {UserSession, "Alice"})
DynamicSupervisor.start_child(MyDynamicSup, {UserSession, "Bob"})
DynamicSupervisor.start_child(MyDynamicSup, {UserSession, "Charlie"})

# 4. Checking the team
counts = DynamicSupervisor.count_children(MyDynamicSup)
IO.puts("\nApp: We currently have #{counts.active} active workers.")
```

## ▶️ How to Run

```bash
elixir code/22.dynamic_supervisors.exs
```

## 📝 Expected Output

```text
App: Letting users in...
--- [SYSTEM] Starting session for Alice
--- [SYSTEM] Starting session for Bob
--- [SYSTEM] Starting session for Charlie

App: We currently have 3 active workers.
```

## 💡 Why This Matters

Dynamic Supervisors are how Elixir scales. A single server can manage hundreds of thousands of dynamic processes (like individual chat rooms or player sessions) without breaking a sweat. It allows your app to be "Flexible" and only use memory for what is actually happening right now.
