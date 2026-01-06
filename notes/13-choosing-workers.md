# 13. Choosing Your Tool: Task vs. Agent vs. GenServer 🛠️

In the Elixir world, you have several ways to run code in a process. It can be confusing for a beginner to know which one to pick. 

Think of Elixir as a giant company. You have different types of workers for different jobs.

---

## 1. Task (The One-Off Contractor) 👷
A **Task** is for a job that has a beginning and an end. It doesn't "remember" anything after it's done.

- **Mental Model**: Hiring a contractor to paint a wall. They come in, paint, and leave. You don't call them again to ask how the paint is doing; the job is finished.
- **Use Case**: Sending an email in the background, resizing an image, or calculating a big math problem while the user continues surfing your site.
- **Syntax**: `Task.start(fn -> ... end)`

## 2. Agent (The Specialized Clerk) 📑
An **Agent** is a process that exists only to **store a value**. 

- **Mental Model**: A clerk whose only job is to hold a clipboard with a number on it. If you ask "What's the number?", they tell you. If you say "Update the number to 10," they do it. They don't have any complex logic.
- **Use Case**: A simple counter, storing a user's theme preference, or a temporary cache of search results.
- **Syntax**: `Agent.start_link(fn -> [] end)`

## 3. GenServer (The Project Manager) 👔
A **GenServer** is the "Pro" tool. It can store state **AND** handle complex logic, timers, and external requests.

- **Mental Model**: A manager who has a clipboard (state), but can also handle complex emails, coordinate other workers, and follow strict rules.
- **Use Case**: A Task Manager (like our project!), a chat room, a database connection pool, or a game loop.
- **Syntax**: `use GenServer` (as we saw in Lesson 12).

---

## ⚖️ When to pick what? (The Decision Matrix)

| Want to do this? | Use this! |
| :--- | :--- |
| Run a quick task in the background and forget it? | **Task** |
| Run multiple tasks and wait for them to finish? | **Task.async / Task.await** |
| Just want a place to store a simple variable/state? | **Agent** |
| Need complex logic, state, and reliability? | **GenServer** |

---

## 🧪 Working Code

```elixir
# filename: code/13.workers.exs

# 1. THE TASK (One-off)
Task.start(fn -> 
  Process.sleep(100)
  IO.puts("Task: I've finished the background work!")
end)

# 2. THE AGENT (Simple State)
{:ok, agent} = Agent.start_link(fn -> 0 end)
Agent.update(agent, fn count -> count + 1 end)
IO.puts("Agent: The current count is #{Agent.get(agent, & &1)}")

# 3. THE GENSERVER (Complex - See Lesson 12 for the full example)
IO.puts("GenServer: Use this for your bigger projects!")

# Wait a bit for the async task to print
Process.sleep(200)
```

## ▶️ How to Run

```bash
elixir code/13.workers.exs
```

## 💡 Why This Matters

Using the right tool makes your code simpler. You *could* build a simple counter using a GenServer, but an Agent is 5 lines of code instead of 30. Choosing the right "worker type" keeps your system lean and easy to maintain.
