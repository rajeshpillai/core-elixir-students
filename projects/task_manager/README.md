# 📝 Task Manager (Basic Project)

This project is part of the Elixir Core Bootcamp. It demonstrates how to separate core business logic from state management using GenServers and Supervisors.

## 🚀 Features
- **Functional Core**: Pure logic for task transformations.
- **Stateful Server**: A GenServer that maintains the task list.
- **Auto-Start**: Managed by an OTP application and supervisor.

## 🏗️ Architecture
1. **`TaskManager.Task`**: The data struct.
2. **`TaskManager.Core`**: Pure functions for list manipulation.
3. **`TaskManager.Server`**: The GenServer/Worker.
4. **`TaskManager.Application`**: The supervisor that keeps the server alive.

---

## 🛠️ Usage

This app starts automatically when you enter the IEx session.

```bash
iex -S mix
```

Try these commands:
```elixir
# Add a task
TaskManager.add_task("Buy Coffee ☕")

# List all tasks
TaskManager.list_tasks()

# Complete a task by ID
TaskManager.complete_task(1)
TaskManager.list_tasks()
```

## 🧪 Testing
Run the automated test suite:
```bash
mix test
```

## 📚 Related Lessons
- [Lesson 10: Maps & Structs](notes/10-maps-structs.md)
- [Lesson 12: GenServer Basics](notes/12-genserver-basics.md)
- [Lesson 21: Supervision Trees](notes/21-supervision-trees.md)
