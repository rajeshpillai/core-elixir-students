# 13. Choosing Your Tool: Task & Agent

# --- 1. TASK ---
# Use a Task for "Fire and Forget" work.
IO.puts("Main: Starting a background task...")

Task.start(fn -> 
  # This part is running in the background!
  Process.sleep(500)
  IO.puts("\nTask: Background work complete! (e.g. Email sent)")
end)

IO.puts("Main: I can keep working while the task runs in the background.")

# --- 2. AGENT ---
# Use an Agent for simple state (storage) without complex logic.
# Think of it as a "Shared Variable" that is safe across processes.

{:ok, my_bucket} = Agent.start_link(fn -> [] end)

# Adding to the bucket
Agent.update(my_bucket, fn list -> ["Apple" | list] end)
Agent.update(my_bucket, fn list -> ["Banana" | list] end)

# Checking the bucket
contents = Agent.get(my_bucket, fn list -> list end)
IO.puts("Agent Bucket: #{inspect(contents)}")

# --- 3. GENSERVER ---
# (See code/12.genserver_basics.exs for the full power of GenServer)

# Let's wait a bit so the Task has time to output its message
Process.sleep(1000)
IO.puts("Main: Done!")
