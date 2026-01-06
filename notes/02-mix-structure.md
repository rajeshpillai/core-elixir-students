# 02. The Mix Project Structure

Now that you've seen the "postal system" (the BEAM), let's talk about the **Toolbox**. 

In Elixir, we don't just write loose files. We build "Projects" using a tool called **Mix**.

## 🧠 The Mental Model: The Swiss Army Knife

Imagine you are building a LEGO castle. You need:
1. **The Bricks**: These are your code files.
2. **The Instructions**: This is how you put it together.
3. **The Box**: This holds everything together.

**Mix** is like a magic LEGO box that also acts as a foreman. It:
- Sets up your project.
- Downloads extra "bricks" (libraries) from the internet.
- Checks if your code has errors (compiling).
- Runs your tests to make sure things aren't broken.

## 🧩 New Concepts

- **Mix**: The build tool for Elixir.
- **mix.exs**: The "Heart" of the project. It lists the project's name, version, and dependencies.
- **lib/**: This is where your actual "bricks" (code) live.
- **test/**: This is where you write scripts to check if your code works correctly.
- **_build/**: Think of this as the "Work Bench." Mix puts compiled files here. You don't usually touch this.

## 🧪 Exploration

We already ran `mix new projects/bootcamp` to create our project. Let's look inside `projects/bootcamp/mix.exs`.

```elixir
defmodule Bootcamp.MixProject do
  use Mix.Project

  def project do
    [
      app: :bootcamp,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # ... other functions ...
end
```

Don't worry about the syntax yet! Just notice that it looks like a list of configuration details.

## ▶️ How to Run

Go into the project folder and try running the "Interactive Elixir" shell with your project loaded:

```bash
cd projects/bootcamp
iex -S mix
```

Inside `iex`, you can try calculating things using code from your project!

## 📝 Expected Output

When you run `iex -S mix`, you should see something like:
```text
Interactive Elixir (1.x.x) - press Ctrl+C to exit (type h() ENTER for help)
Erlang/OTP XX [erts-XX] [source] [64-bit] [smp:X:X] [ds:X:X:10] [async-threads:1] [jit:load-address-die]

Compiling X files (.ex)
Generated bootcamp app
iex(1)> 
```

## 💡 Why This Matters

Standardizing our structure means that if you walk into any Elixir company in the world, their project will look exactly like yours. You'll know exactly where the code is (`lib/`) and how to run it (`mix`).
