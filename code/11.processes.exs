# 11. Processes & Mailbox

# 1. Finding out who I am
my_id = self()
IO.puts("Main Process PID: #{inspect(my_id)}")

# 2. Spawning a new, independent worker
child_pid = spawn(fn -> 
  # This code runs in a different "room"
  receive do
    {:ping, sender_pid} -> 
      IO.puts("Child: Received Ping!")
      send(sender_pid, :pong)
  end
end)

IO.puts("Child Process PID: #{inspect(child_pid)}")

# 3. Message Passing (Communication)
# Send a ping to the child and include our own PID so they can reply
send(child_pid, {:ping, self()})

# 4. Receiving the reply
receive do
  :pong -> 
    IO.puts("Main: Received Pong from child!")
after 
  1000 -> 
    IO.puts("Main: Child didn't respond in time.")
end

# 5. Proof of Isolation
IO.puts("\nIf I try to send a message to a PID that doesn't exist...")
send(pid(0, 999, 0), :hello)
IO.puts("Nothing happens! No crash. It just goes into the void.")
