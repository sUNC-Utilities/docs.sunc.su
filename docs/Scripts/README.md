# Scripts

The **Scripts** library provides advanced functions for inspecting and interacting with Lua script objects. It allows you to analyse bytecode, retrieve closures and environments, and simulate the loading or running of scripts.

---

## 🚦 What can you do?

With the Scripts library, you can:

- **Read compiled bytecode** from live scripts using [`#!luau getscriptbytecode`](./getscriptbytecode.md)
- **Get the bytecode hash** of any script using [`#!luau getscripthash`](./getscripthash.md)
- **Extract the script closure** using [`#!luau getscriptclosure`](./getscriptclosure.md)
- **Access script environments** with [`#!luau getsenv`](./getsenv.md)
- **Enumerate script instances** using [`#!luau getscripts`](./getscripts.md) and [`#!luau getrunningscripts`](./getrunningscripts.md)
- **List loaded modules** via [`#!luau getloadedmodules`](./getloadedmodules.md)
- **Determine the current script** executing via [`#!luau getcallingscript`](./getcallingscript.md)
- **Compile and run code at runtime** using [`#!luau loadstring`](./loadstring.md)

---

## 🚫 What can't you do?

While powerful, these functions come with limitations and risks:

- Not all scripts have valid bytecode; functions like [`#!luau getscriptbytecode`](./getscriptbytecode.md) and [`#!luau getscripthash`](./getscripthash.md) will return `#!luau nil` in such cases.
- Bytecode-related functions **must not modify or decompile** the bytecode; use as-is.
- Avoid indiscriminately executing functions from [`#!luau getscriptclosure`](./getscriptclosure.md) or [`#!luau loadstring`](./loadstring.md) without verifying safety.
