# 16. Lazy Evaluation: The Power of Streams 💧

As an intermediate developer, you have to start thinking about **Memory**. 

If you have a file with 1 million lines and you use `Enum.map`, Elixir will try to read **all 1 million lines** into a giant list in your computer's RAM. 
If the file is bigger than your RAM, your computer will "Freeze" or "Crash."

To solve this, Elixir uses **Streams**.

---

## 🧠 The Mental Model: The Bucket vs. The Water Pipe

### 1. Enum (The Bucket 🪣)
Imagine you want to move water from a well to a garden.
- You fill a bucket at the well.
- You carry the whole bucket to the garden and pour it out.
- **Problem**: If you need to move a swimming pool's worth of water, you need a swimming-pool-sized bucket. Your arms (RAM) will break!

### 2. Stream (The Water Pipe 🚰)
Imagine you lay down a long pipe.
- Water flows through the pipe piece by piece.
- You only ever have a tiny bit of water inside the pipe at any one time.
- **Benefit**: You can move an entire ocean of water using a tiny pipe, because you only handle the water one drop at a time.

## 🧩 New Concepts

- **Eager Evaluation (`Enum`)**: Does all the work right now and creates a result immediately.
- **Lazy Evaluation (`Stream`)**: Doesn't do any work yet. It just creates a "plan." The work only happens when you finally ask for the result.
- **Composable**: You can chain 100 `Stream` operations together, and Elixir will still only pass each item through the pipe one at a time.

---

## 🧪 Working Code

```elixir
# filename: code/16.streams.exs

# 1. ENUM (Eager) - This handles EVERYTHING at once
list = [1, 2, 3, 4, 5]
enum_result = Enum.map(list, fn x -> 
  IO.puts("Enum working on #{x}")
  x * 2 
end)
IO.puts("Enum Result Ready: #{inspect(enum_result)}\n")

# 2. STREAM (Lazy) - This doesn't do anything yet!
stream = Stream.map(list, fn x -> 
  IO.puts("Stream working on #{x}")
  x * 2 
end)

IO.puts("I've created the stream, but notice no 'Stream working' messages appeared!")
IO.puts("Stream reference: #{inspect(stream)}\n")

# 3. Running the Stream
# We use Enum.to_list or Enum.take to 'turn on the faucet'
IO.puts("Now, let's turn on the faucet:")
final_result = Enum.to_list(stream)
IO.puts("Final Result: #{inspect(final_result)}")
```

## ▶️ How to Run

```bash
elixir code/16.streams.exs
```

## 📝 Expected Output

```text
Enum working on 1
Enum working on 2
Enum working on 3
Enum working on 4
Enum working on 5
Enum Result Ready: [2, 4, 6, 8, 10]

I've created the stream, but notice no 'Stream working' messages appeared!
Stream reference: #Stream<...>

Now, let's turn on the faucet:
Stream working on 1
Stream working on 2
Stream working on 3
Stream working on 4
Stream working on 5
Final Result: [2, 4, 6, 8, 10]
```

## 💡 Why This Matters

Streams allow you to handle "Infinite" data. You could create a stream of every number from 1 to infinity, and Elixir won't crash! It will just wait for you to say `Enum.take(stream, 5)` to give you the first five. This makes Elixir world-class at processing big data and logs.
