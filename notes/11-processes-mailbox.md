# 11. Processes & The Mailbox 📬

Remember the **Postal System** analogy from Lesson 01? Now we're going to see how it actually works in code!

In Elixir, everything runs inside a **Process**. A process is like a tiny, independent worker. 

---

## 🧠 The Mental Model: The Little Office Worker 🧑‍💼

Imagine an office with 1,000 tiny rooms. Each room has:
1. **One Worker**: They can only do one thing at a time.
2. **A Private Mailbox**: Only they can read their mail.
3. **No Windows**: They can't see what other workers are doing. They can't touch other workers' desks.

If Worker A wants Worker B to do something, they write a letter (a **Message**) and drop it in Worker B's mailbox. 
Worker B checks their mailbox, reads the letter, and decides what to do.

## 🧩 New Concepts

- **Process**: A tiny, isolated "worker" in memory. Elixir can run millions of these.
- **PID (Process ID)**: The "Room Number" of the worker. You need this to send them mail.
- **`spawn`**: Creating a new worker/process.
- **`send`**: Dropping a message into a worker's mailbox.
- **`receive`**: When a worker checks their mailbox and acts on a message.
- **Self**: Every process has its own PID. You can find yours by calling `self()`.

---

## 🧪 Working Code

```elixir
# filename: code/11.processes.exs

# 1. Let's create a 'Receiver' worker
worker_pid = spawn(fn -> 
  # This worker is now waiting for a letter
  receive do
    {:hello, name} -> 
      IO.puts("Worker: I received a hello from #{name}!")
    {:pizza, type} -> 
      IO.puts("Worker: Oh boy! A #{type} pizza!")
    _other -> 
      IO.puts("Worker: I don't know what this message is.")
  end
end)

# 2. Let's send a message to the worker!
# We use the syntax: send(recipient_pid, message)
send(worker_pid, {:hello, "Rajesh"})

# Let's send another one
send(worker_pid, {:pizza, "Pepperoni"})

# Wait a tiny bit for the worker to finish
Process.sleep(100)
```

## ▶️ How to Run

```bash
elixir code/11.processes.exs
```

## 📝 Expected Output

```text
Worker: I received a hello from Rajesh!
```
*(Wait, why didn't we see the pizza message?)*

> **⚠️ TEACHER'S NOTE**: 
> In the code above, the worker process **stops** after handling the *first* message. In Elixir, if you want a worker to keep working, they have to call themselves again (Recursion!). We'll learn how to make "Permanent Workers" in the next lesson.

## 💡 Why This Matters

This is why Elixir is so "indestructible." If one worker makes a mistake and "crashes," they just leave their tiny room. Since they weren't touching anyone else's desk, **no one else is affected**. The system can just spawn a new worker to take their place. This is called **Fault Tolerance**.
