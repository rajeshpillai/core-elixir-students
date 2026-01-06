# 15. The 'with' Expression

defmodule Auth do
  # Simulating some external checks
  def get_user(id) do
    case id do
      1 -> {:ok, %{id: 1, name: "Admin", role: :admin}}
      2 -> {:ok, %{id: 2, name: "Guest", role: :user}}
      _ -> {:error, :not_found}
    end
  end

  def check_permissions(user) do
    if user.role == :admin, do: :ok, else: {:error, :unauthorized}
  end
end

defmodule App do
  def access_vault(user_id) do
    # 'with' handles the chain of {:ok, ...} results
    with {:ok, user} <- Auth.get_user(user_id),
         :ok <- Auth.check_permissions(user) do
      # If all above match, we enter here
      IO.puts("🔓 ACCESS GRANTED for #{user.name}")
    else
      # If ANY step fails, we handle it here
      {:error, :not_found} -> IO.puts("❌ User not found.")
      {:error, :unauthorized} -> IO.puts("❌ You're not an admin!")
    end
  end
end

# Test cases
App.access_vault(1) # Admin - Success
App.access_vault(2) # User - Unauthorized
App.access_vault(3) # Unknown - Not found
