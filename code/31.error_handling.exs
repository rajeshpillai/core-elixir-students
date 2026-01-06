# 31. Error Handling Mastery

IO.puts("--- HANDLING ERRORS ---\n")

# 1. The Functional Way (Tagged Tuples)
# This is how 99% of Elixir code handles errors.
defmodule FileUploader do
  def upload(file_size) when file_size < 100, do: {:ok, "File uploaded!"}
  def upload(_), do: {:error, :file_too_large}
end

case FileUploader.upload(500) do
  {:ok, msg} -> IO.puts("Success: #{msg}")
  {:error, :file_too_large} -> IO.puts("Failed: Use a smaller file please.")
end

# 2. The Defensive Way (Try / Rescue)
# This is for preventing a crash when calling "Dangerous" code.
IO.puts("\nAttempting a dangerous operation...")

try do
  # This would normally crash the whole script
  String.to_integer("cat")
rescue
  ArgumentError -> IO.puts("Rescue: You can't turn a 'cat' into a number!")
end

# 3. The 'After' block (Cleaning up)
try do
  IO.puts("Opening a fake database connection...")
  # simulate error
  # 1 / 0 
after
  IO.puts("Closing the connection (This ALWAYS runs).")
end
