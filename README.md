# 💜 Elixir Core Bootcamp

Welcome, Intern! This repository is your step-by-step guide to mastering Elixir from scratch. 

## 🗺️ How to use this Bootcamp
This is not a book you just read. It's a **Hands-on Journey**.
1. Read the **Note** in `notes/XX-topic.md`.
2. Run the **Code** in `code/XX.topic.exs` or the corresponding project.
3. Try changing the code to see what happens!

## 🚀 Pre-requisites
Before you start, make sure you have Elixir installed:
- Run `elixir -v` in your terminal. If you don't see a version number, go to [elixir-lang.org/install](https://elixir-lang.org/install.html).

## 📚 Curriculum Roadmap

### Phase 1: Foundations
- **01.** [Introduction & The BEAM](notes/01-introduction-beam.md) - The Postal System model.
- **02.** [Mix Project Structure](notes/02-mix-structure.md) - Our toolbox.
- **03.** [Variables & Immutability](notes/03-variables-immutability.md) - The photocopy model.

### Phase 2: Functional Thinking
- **04.** [Basic & Pure Functions](notes/04-basic-pure-functions.md) - The Recipe model.
- **05.** [Data Types](notes/05-data-types.md) - Numbers, Strings, and Atoms.
- **06.** [Lists & Tuples](notes/06-lists-tuples.md) - The Train vs. The Egg Carton.
- **07.** [Pattern Matching](notes/07-pattern-matching.md) - The Balance Scale.

### Phase 3: Advanced Concepts
- **08.** [Recursion](notes/08-recursion.md) - Loops without loops.
- **09.** [Pipelines](notes/09-pipelines.md) - The Assembly Line.
- **10.** [Maps & Structs](notes/10-maps-structs.md) - Organizing Data.

### Phase 4: Concurrency
- **11.** [Processes & Mailbox](notes/11-processes-mailbox.md) - Tiny workers.
- **12.** [GenServer Basics](notes/12-genserver-basics.md) - The Store Clerk.
- **13.** [Choosing Your Worker](notes/13-choosing-workers.md) - Task vs. Agent vs. GenServer.

### Phase 5: The Project
- **14.** [Task Manager](notes/14-final-project.md) - Building a real app.

### Phase 6: The Intermediate Bridge (Advanced FP)
- **15.** [The `with` Expression](notes/15-with-expression.md) - Managing the Happy Path.
- **16.** [Lazy Evaluation (Streams)](notes/16-streams.md) - The Water Pipe model.
- **17.** [Protocols & Polymorphism](notes/17-protocols.md) - Shape-shifting code.
- **18.** [Higher-Order Mastery (`reduce`)](notes/18-reduce.md) - The Swiss Army Knife.
- **19.** [Behaviours & Callbacks](notes/19-behaviours.md) - The Industry Contract.

### Phase 7: Advanced Core Elixir (The Master of the BEAM)
- **20.** [Metaprogramming (Macros)](notes/20-metaprogramming.md) - Code that writes code.
- **21.** [Supervision Trees](notes/21-supervision-trees.md) - The "Let it Crash" model.
- **22.** [Dynamic Supervisors](notes/22-dynamic-supervisors.md) - Scaling on demand.
- **23.** [ETS (Erlang Term Storage)](notes/23-ets.md) - Fast in-memory storage.
- **24.** [Distribution Basics](notes/24-distribution.md) - Scaling across servers.

### Phase 8: Final Graduation
- **25.** [Capstone: Distributed Task Manager](notes/25-capstone-project.md) - Building a cluster-aware app.

### Phase 9: Functional Patterns (The Scientist's Mindset)
- **26.** [Monoids](notes/26-monoids.md) - The Laws of Combination.
- **27.** [Functors](notes/27-functors.md) - The Art of Mapping.
- **28.** [Folds (Reducers)](notes/28-folds.md) - Collapsing data structures.
- **29.** [Function Composition](notes/29-composition.md) - Building the logic chain.

### Phase 10: Professional Polish (Production Ready)
- **30.** [Typespecs & Documentation](notes/30-typespecs.md) - The Industry Contract.
- **31.** [Error Handling](notes/31-error-handling.md) - The Safety Net.
- **32.** [Property-Based Testing](notes/32-property-testing.md) - The Stress Test model.

## 🛠️ Pro Tips for Freshers
- **The Helper**: Inside `iex`, if you're confused about a function (like `Enum.map`), type `h Enum.map`. It's your built-in documentation!
- **Inspection**: Use `IO.inspect(variable)` to peek inside a variable. It shows you exactly what Elixir sees.
- **Crashes are OK**: In Elixir, we "Let it Crash." Don't be afraid of errors; the BEAM is designed to handle them.

**Happy Learning!**
