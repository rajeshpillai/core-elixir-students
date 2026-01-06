# 23. ETS: The High-Speed Library 🗄️

In Lesson 12, we learned that a **GenServer** holds state. But there is a small problem: A GenServer can only handle **one message at a time**.

If you have 10,000 users all trying to read the same data from a GenServer at the exact same millisecond, they have to wait in a long line. The GenServer becomes a "Bottleneck."

To solve this, we use **ETS (Erlang Term Storage)**.

---

## 🧠 The Mental Model: The Private Notebook vs. The Public Library 📚

### 1. GenServer (The Private Notebook 📓)
The Manager has a notebook. If you want to see what's inside, you have to ask him. He looks it up, reads it to you, and then helps the next person.
- **Problem**: Slow for many readers.

### 2. ETS (The Public Library 🏛️)
The Manager takes the data and puts it on a shelf in a Public Library.
- **Benefit**: 1,000 people can walk into the library and read the book **at the same time** without asking the Manager for permission.
- **Speed**: It is incredibly fast (close to C speed).

## 🧩 New Concepts

- **ETS Table**: A place in memory to store key-value data.
- **Named Table**: Giving the table a name (like `:my_cache`) so any process can find it.
- **Concurrency**: Multiple processes reading from the same table simultaneously.
- **Persistence**: An ETS table is owned by a process. If that process dies, the table dies (unless you name a "Heir").

---

## 🧪 Working Code

```elixir
# filename: code/23.ets.exs

# 1. Create a Table
# :named_table -> so we can refer to it by name
# :public -> so any process can read/write
# :set -> keys must be unique
:ets.new(:user_lookup, [:named_table, :public, :set])

# 2. Putting data in
# Data must be a Tuple. Usually {key, value1, value2...}
:ets.insert(:user_lookup, {"rajesh", "Senior Engineer", 35})
:ets.insert(:user_lookup, {"alice", "Designer", 28})

# 3. Looking data up
# It returns a list (because some table types allow duplicate keys)
# lookup(table_name, key)
case :ets.lookup(:user_lookup, "rajesh") do
  [{name, role, age}] -> 
    IO.puts("Found #{name}: He is a #{role} and is #{age} years old.")
  [] -> 
    IO.puts("User not found.")
end

# 4. Deleting data
:ets.delete(:user_lookup, "alice")
IO.puts("Deleted alice. Table size: #{inspect(:ets.info(:user_lookup, :size))}")
```

## ▶️ How to Run

```bash
elixir code/23.ets.exs
```

## 📝 Expected Output

```text
Found rajesh: He is a Senior Engineer and is 35 years old.
Deleted alice. Table size: 1
```

## 💡 Why This Matters

ETS is the secret weapon for high-performance Elixir apps. It is used for session storage, caching database results, and managing shared state that needs to be accessed by millions of web requests every second. Whenever you find your GenServer is "too busy" simply answering questions, it's time to move that data to ETS!
