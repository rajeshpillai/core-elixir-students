# 20. Metaprogramming & Macros

# 1. Understanding the AST (Abstract Syntax Tree)
# Let's see how Elixir sees the code 1 + 2
ast = quote do: 1 + 2
IO.puts("How Elixir sees '1 + 2':\n#{inspect(ast)}\n")

# 2. Creating a 'Debug' Macro
defmodule LoggerMacros do
  defmacro debug(expression) do
    # quote turns the following block into AST
    quote do
      # unquote puts the ACTUAL value in here
      result = unquote(expression)
      IO.puts("--- DEBUG LOG ---")
      IO.puts("Code: #{unquote(Macro.to_string(expression))}")
      IO.puts("Result: #{inspect(result)}")
      IO.puts("-----------------")
      result
    end
  end
end

# 3. Using the Macro
defmodule Demo do
  require LoggerMacros

  def test do
    # This will print the code itself AND the result
    LoggerMacros.debug(5 * 5 + 10)
  end
end

Demo.test()
