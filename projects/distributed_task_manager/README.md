# 🌐 Distributed Task Manager (Capstone Project)

Welcome to the final capstone project of the Elixir Core Bootcamp! This application demonstrates the power of the BEAM by creating a cluster-aware Task Manager that shares state across multiple nodes without an external database.

## 🚀 Key Features
- **Global Registration**: The task server is registered across the entire cluster.
- **Node Agnostic**: Add tasks from any node; they all end up in the same global state.
- **Fail-Safe**: If a node goes down, the cluster remains functional.

## 🏗️ Architecture
This project uses the following advanced Elixir concepts:
1. **GenServer**: Manages the state of the task list.
2. **`:global` Name Registration**: Allows any node to find the server process.
3. **Application & Supervision**: The server is automatically started and restarted if it crashes.

---

## 🛠️ How to Run (Multi-Node Setup)

To see the distributed power, you need to start two nodes and connect them. 

> [!TIP]
> Make sure you are inside the `projects/distributed_task_manager` directory in both terminals before running the commands below.

### 1. Terminal A (Node 1)
```bash
cd projects/distributed_task_manager
iex --name a@127.0.0.1 --cookie secret -S mix
```

### 2. Terminal B (Node 2)
```bash
cd projects/distributed_task_manager
iex --name b@127.0.0.1 --cookie secret -S mix
```

### 3. Build the Highway (Connect Nodes)
In **Terminal B**, connect to Terminal A:
```elixir
Node.connect(:"a@127.0.0.1")
```

### 4. Use the Global API
Now, try these commands in **either** terminal:

```elixir
# Check if the nodes see each other
DistributedTaskManager.cluster_info()

# Add tasks from Node B
DistributedTaskManager.add_task("Finish the Bootcamp 🎓")
DistributedTaskManager.add_task("Build something cool 🚀")

# List tasks from Node A
DistributedTaskManager.list_tasks()

# Complete a task from Node B
DistributedTaskManager.complete_task(1)

# Verify on Node A
DistributedTaskManager.list_tasks()
```

---

## 🧪 Testing

To run the local unit tests:
```bash
mix test
```

## 📚 Related Lessons
This project is the culmination of:
- [Lesson 12 & 21: GenServers and Supervision](notes/12-genserver-basics.md)
- [Lesson 24: Distribution Basics](notes/24-distribution.md)
- [Lesson 25: Globally Registered Processes](notes/25-capstone-project.md)
