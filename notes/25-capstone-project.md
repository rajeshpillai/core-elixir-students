# 25. Capstone: Distributed Task Manager 🌐🛠️

This is it! The final challenge. We are going to build a Task Manager that runs across **multiple nodes**. 

Imagine you have two computers:
- You add a task on **Computer A**.
- You run `list_tasks` on **Computer B**.
- **Computer B** shows the task added on **Computer A**.

---

## 🏗️ The Architecture: Magic without a Database

In traditional programming, you'd need a Database (like Postgres or Redis) to share data between two servers. In Elixir, we don't need one for this!

### 🧩 Components we'll use:
- **`:global` Registration**: Instead of naming our server `:task_server` (which only works on one node), we register it as `{:global, :task_server}`. This makes the server accessible from **anywhere in the cluster**.
- **Supervision**: Ensuring the server is always running.
- **Node Monitoring**: Being aware when other computers join or leave our team.

---

## 🧠 The Mental Model: The Global Office 🏢

In our previous project, every house had its own Manager.
In this project, we have a **Global Manager**. 
- Even if there are 10 office buildings (Nodes), there is only **one** Global Manager.
- Any worker in any building can pick up the phone and talk to that specific Manager as if they were in the same room.

---

## 🧪 Project Structure

We'll use a simplified version of our Task Manager, but with **Global Power**:
- `lib/distributed_task_manager/server.ex`: The GenServer that uses `{:global, ...}`.
- `lib/distributed_task_manager.ex`: The API that looks for the global process.

## ▶️ Let's Build!

Check out the code in `projects/distributed_task_manager/lib/`. 

### To see the magic (Two Terminal Exercise):

1. **Terminal A**: 
   ```bash
   cd projects/distributed_task_manager
   iex --name a@127.0.0.1 --cookie secret -S mix
   ```
2. **Terminal B**: 
   ```bash
   cd projects/distributed_task_manager
   iex --name b@127.0.0.1 --cookie secret -S mix
   ```
3. **In Terminal B**, connect to A: 
   ```elixir
   Node.connect(:"a@127.0.0.1")
   ```
4. **Try the Global API** in either terminal:
   ```elixir
   DistributedTaskManager.add_task("Work from Node B")
   DistributedTaskManager.list_tasks()
   DistributedTaskManager.complete_task(1)
   DistributedTaskManager.list_tasks()
   ```

You will see that they share the exact same list!
