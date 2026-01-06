# 30. Typespecs and Documentation Mastery

defmodule UserSystem do
  @moduledoc "Handles user data with strict typing."

  # 1. Defining a custom type
  # This says a 'User' is a map with a string name and an integer age.
  @type user :: %{name: String.t(), age: integer()}

  @doc "Validates if a user is an adult."
  @spec adult?(user()) :: boolean()
  def adult?(user) do
    user.age >= 18
  end

  @doc "Formats a user for display."
  @spec format(user()) :: String.t()
  def format(user) do
    "#{user.name} (Age: #{user.age})"
  end
end

# Usage
my_user = %{name: "Rajesh", age: 35}

if UserSystem.adult?(my_user) do
  IO.puts(UserSystem.format(my_user) <> " is allowed in.")
end

# 💡 Pro Tip:
# If you try to pass %{name: "Alice", age: "Twenty"} to these functions,
# a tool called 'Dialyzer' will catch the error because "Twenty" is a String, 
# but our @type says age MUST be an integer!
