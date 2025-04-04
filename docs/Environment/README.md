# Environment

The **Environment** library provides tools to access and inspect internal Luau and Roblox engine state. This includes access to executor-specific globals, the Roblox runtime environment, and Lua's garbage-collected memory space.

These functions are most useful for **analysis** and **environment-level manipulation**.

---

## 🚦 What can you do?

With the Environment library, you can:

- **Access executor globals** using [`#!luau getgenv`](./getgenv.md)
- **Modify the live game environment** using [`#!luau getrenv`](./getrenv.md)
- **View all GC-tracked functions and values** using [`#!luau getgc`](./getgc.md)
- **Filter** garbage-collected values with fine-tuned criteria using [`#!luau filtergc`](./filtergc/README.md)

---

## 🧠 Deep Dive: [`#!luau filtergc`](./filtergc/README.md)

The [`#!luau filtergc`](./filtergc/README.md) function is a powerful tool that inspects garbage-collected memory for:

- Luau **functions** matching bytecode constants, names, or upvalues.
- Luau **tables** matching specific keys, values, metatables, and more.

Explore more:

- [Function filters](./filtergc/FunctionFilterOptions.md)
- [Table filters](./filtergc/TableFilterOptions.md)

---

## 🚫 What can't you do?

These functions expose deep internal mechanisms and should be used responsibly:

- Avoid modifying the **Roblox environment** ([`#!luau getrenv()`](./getrenv.md)) without understanding potential game-breaking effects.
- Use [`#!luau filtergc`](./filtergc/README.md) with caution - performance may degrade if run frequently or on large heaps.
