# 23. ETS (Erlang Term Storage) Mastery

# --- 1. SET (Unique Keys) ---
:ets.new(:my_set, [:set, :named_table, :public])
:ets.insert(:my_set, {:a, 1})
:ets.insert(:my_set, {:a, 2}) # This overwrites {:a, 1}
IO.puts("Set Result (Overwritten): #{inspect(:ets.lookup(:my_set, :a))}")

# --- 2. BAG (Duplicate Keys Allowed) ---
:ets.new(:my_bag, [:bag, :named_table, :public])
:ets.insert(:my_bag, {:apple, "Red"})
:ets.insert(:my_bag, {:apple, "Green"})
IO.puts("Bag Result (Duplicates kept): #{inspect(:ets.lookup(:my_bag, :apple))}")

# --- 3. CONCURRENT ACCESS ---
# Let's start a process that writes to a table, and read from the main process.
:ets.new(:speed_test, [:set, :named_table, :public])

Task.start(fn -> 
  Process.sleep(100)
  :ets.insert(:speed_test, {:status, "Background process finished writing!"})
end)

IO.puts("Main: Waiting for background process...")
Process.sleep(200)

{_, message} = :ets.lookup(:speed_test, :status) |> List.first()
IO.puts("Main received: #{message}")
