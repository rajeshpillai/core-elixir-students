# 16. Streams & Lazy Evaluation

# Example: Finding the first 3 square numbers divisible by 5
# in a huge range of 1 to 10 million.

IO.puts("--- USING ENUM (Greedy) ---")
start_enum = System.monotonic_time(:millisecond)

_enum_result = 
  1..10_000_000
  |> Enum.map(&(&1 * &1))           # Creates a 10 million item list! (Slow & heavy)
  |> Enum.filter(&(rem(&1, 5) == 0)) # Creates another list!
  |> Enum.take(3)                   # Finally takes 3 and throws the rest away.

end_enum = System.monotonic_time(:millisecond)
IO.puts("Enum took: #{end_enum - start_enum}ms")

IO.puts("\n--- USING STREAM (Lazy) ---")
start_stream = System.monotonic_time(:millisecond)

_stream_result = 
  1..10_000_000
  |> Stream.map(&(&1 * &1))          # Does nothing yet.
  |> Stream.filter(&(rem(&1, 5) == 0)) # Does nothing yet.
  |> Enum.take(3)                    # Processes items ONE BY ONE until it hits 3.

end_stream = System.monotonic_time(:millisecond)
IO.puts("Stream took: #{end_stream - start_stream}ms")

IO.puts("\nNotice how much faster the Stream is!")
IO.puts("This is because Stream STOPPED working the moment it found 3 matching items.")
IO.puts("Enum had to finish all 10 million items first!")
