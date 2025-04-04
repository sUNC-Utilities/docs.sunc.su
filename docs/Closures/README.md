# Closures

The **Closures** library enables the inspection, modification and creation of Luau closures with precise control.

It is one of the most powerful tools available, exposing internals in a way that Luau does not natively support out of the box.

This library is incredibly useful for hooking functions to modify game logic to your own advantage, and any other creative uses you can think of.

---

## 🧠 What the f%$@ is a closure?

The term [*"closure"*](https://en.wikipedia.org/wiki/Closure_(computer_programming)) comes from [functional programming](https://en.wikipedia.org/wiki/Functional_programming) and refers to a function ***plus*** the environment it carries (its **upvalues**).

In Luau (and Lua), **every function is implemented as a closure** implicitly, even if it doesn't capture anything.

---

## 🚦 What can you do?

With the Closures library, you can:

- **Hook** existing functions or metamethods with [`#!luau hookfunction`](./hookfunction.md) or [`#!luau hookmetamethod`](./hookmetamethod.md)
- **Clone** a function while keeping the same behavior but detaching the identity with [`#!luau clonefunction`](./clonefunction.md)
- **Wrap** a Luau closure into a C closure using [`#!luau newcclosure`](./newcclosure.md)
- **Check** a function's closure type with [`#!luau iscclosure`](./iscclosure.md), [`#!luau islclosure`](./islclosure.md) or [`#!luau isexecutorclosure`](./isexecutorclosure.md).
- **Hash** a function's bytecode with [`#!luau getfunctionhash`](./getfunctionhash.md)

---

## 🚫 What can't you do?

Although closure capabilities are powerful, there are natural boundaries:

- You cannot inspect **true C closures' internals** - they are not Lua-defined, compiled, and therefore opaque by design.
- You cannot force hooking in contexts where upvalue layout or calling conventions are incompatible.
- Attempting to implement [`#!luau newcclosure`](./newcclosure.md) in Lua (e.g. via [`#!luau coroutine.wrap`](https://create.roblox.com/docs/reference/engine/libraries/coroutine#wrap)) **will fail sUNC verification**.
