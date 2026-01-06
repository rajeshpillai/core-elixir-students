# 14. The Final Project: Task Manager 🏗️

Congratulations! You've made it to the finish line of the Elixir core bootcamp. Now it's time to take everything we've learned and build something real.

We are going to build a **Task Manager**.

---

## 🏗️ The Architecture: Putting it all Together

In a real Elixir app, we split our code into two parts:
1. **The Brain (Pure Functions)**: This part doesn't know about processes or states. It just knows how to add, delete, and update tasks in a list.
2. **The Worker (GenServer)**: This part uses "The Brain" to update its clipboard (state).

### 🧩 Components we'll use:
- **Structs**: For defining what a `Task` looks like.
- **Lists**: To hold our collection of tasks.
- **Pattern Matching**: To find specific tasks or handle results.
- **Pipelines**: To make our data transformations look like a story.
- **GenServer**: To make our Task Manager "alive" and able to remember things.

## 🧠 The Mental Model: The Manager and the Library

- **The Library (Core)**: A book that contains all the rules for managing tasks. It doesn't "do" anything; it's just knowledge.
- **The Manager (Server)**: A person who stands in the office. They have a list of tasks. When you tell them "Add a task," they look at the Library to see how to do it correctly, update their list, and keep working.

---

## 🧪 Project Structure

We've created a new project in `projects/task_manager`. Inside `lib/`, we will have:
- `task_manager/task.ex`: The Task struct.
- `task_manager/core.ex`: The "Brain" (Pure functions).
- `task_manager/server.ex`: The "Worker" (GenServer).
- `task_manager.ex`: The main entry point.

## 💡 Why This Setup?

By separating the "Brain" from the "Worker," your code becomes:
- **Easy to Test**: You can test the Brain without starting any processes.
- **Easy to Scale**: You can have one manager for the whole company, or one manager for every single user!

---

## ▶️ Let's Build!

Check out the code in `projects/task_manager/lib/`. To run it, go to that folder and use:

```bash
cd projects/task_manager
iex -S mix
```

### How to use it:

> [!NOTE]
> We've upgraded this project to a proper **OTP Application**. This means the server starts automatically as soon as you open the terminal!

```elixir
# 1. NO NEED to call start() anymore!
# The Supervisor has already hired the clerk.

# 2. Add tasks
TaskManager.add_task("Buy Milk")
TaskManager.add_task("Learn Elixir")

# 3. List tasks
TaskManager.list_tasks()

# 4. Complete a task
TaskManager.complete_task(1)
TaskManager.list_tasks()
```

## 🧪 How to Test

Elixir takes testing very seriously. In the `projects/task_manager` folder, we have a `test/` directory.

To run the automated tests:
```bash
mix test
```

This will run any file ending in `_test.exs`. It's like having a robot double-check your work!
