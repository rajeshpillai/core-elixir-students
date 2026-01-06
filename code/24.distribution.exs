# 24. Distribution Basics

IO.puts("--- NODE INFO ---")
IO.puts("Current Node: #{node()}")
IO.puts("Is Distributed?: #{node() != :nonode@nohost}")
IO.puts("Cookie: #{Node.get_cookie()}")
IO.puts("Connected Nodes: #{inspect(Node.list())}")

IO.puts("\nTo see distribution in action, follow the manual steps in notes/24-distribution.md!")
