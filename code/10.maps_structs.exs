# 10. Maps & Structs

# --- 1. Maps ---
# Maps are key-value pairs.
product = %{
  title: "Lego Castle",
  price: 59.99,
  stock: 10
}

# Accessing values with . (dot syntax)
IO.puts("Product: #{product.title} costs $#{product.price}")

# Updating a value (creates a NEW map)
# This syntax %{ map | key: value } only works for EXISTING keys!
updated_product = %{product | stock: 9}
IO.puts("Stock updated: #{updated_product.stock}")

# --- 2. Structs ---
# Structs are defined in a module.
defmodule Robot do
  # These are the default values
  defstruct name: "Bot", power_level: 100, status: :idle
end

# Using the struct
my_robot = %Robot{name: "Wall-E", power_level: 50}

IO.puts("\nRobot Name: #{my_robot.name}")
IO.puts("Power: #{my_robot.power_level}")
IO.puts("Default Status: #{my_robot.status}")

# Pattern matching works great with maps and structs!
%{name: robot_name} = my_robot
IO.puts("Matched robot name: #{robot_name}")
