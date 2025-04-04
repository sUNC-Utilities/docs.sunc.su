# Metatable

The **Metatable** library enables advanced interaction with [metatables](https://create.roblox.com/docs/luau/metatables) in Luau. It provides direct access to core metamethods and internal table behaviours - including those normally protected or hidden via `#!luau __metatable` locks.

This library is especially useful when trying to modify or access hidden things within locked Roblox objects.

---

## 🧠 What is a metatable?

A [**metatable**](https://create.roblox.com/docs/luau/metatables) in Luau is a hidden table that can change the behavior of another table. Metatables allow you to define custom behaviors like operator overloading, default values, or interception of table reads and writes using special fields like [`#!luau __index`](https://create.roblox.com/docs/luau/metatables#metamethods) or [`#!luau __newindex`](https://create.roblox.com/docs/luau/metatables#metamethods).

In Roblox, this is useful for exposing metatables of Roblox Instances so that they can be leveraged for hooking or internal modification.

---

## 🚦 What can you do?

With the Metatable library, you can:

- **Retrieve** hidden metatables using [`#!luau getrawmetatable`](./getrawmetatable.md)
- **Replace** a table or object's metatable with [`#!luau setrawmetatable`](./setrawmetatable.md)
- **Control** whether a table is mutable/locked using [`#!luau setreadonly`](./setreadonly.md)
- **Check** whether a table is locked with [`#!luau isreadonly`](./isreadonly.md)

---

## 🚫 What can't you do?

- You cannot modify metatables of objects not supported by the executor, let alone Luau itself.
- This library does not provide a way to spoof behavior if your environment lacks real metatable support.
