# Instances

The **Instances** library provides direct access to and manipulation of [`Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) objects in the game world. It includes tools for listing, referencing, and firing Roblox-native interactions.

These functions are especially useful for inspecting hidden instances, working with UI safely, or simulating player interactions with in-game objects.

---

## 🚦 What can you do?

With the Instances library, you can:

- **List all objects** tracked by the client using [`#!luau getinstances`](./getinstances.md)
- **List nil-parented objects** using [`#!luau getnilinstances`](./getnilinstances.md)
- **Safely clone instance references** using [`#!luau cloneref`](./cloneref.md)
- **Access hidden UI containers** using [`#!luau gethui`](./gethui.md)
- **Inspect function-based properties** with [`#!luau getcallbackvalue`](./getcallbackvalue.md)
- **Simulate interactions** using [`#!luau fireclickdetector`](./fireclickdetector.md), [`#!luau fireproximityprompt`](./fireproximityprompt.md), and [`#!luau firetouchinterest`](./firetouchinterest.md)

---

## 🚫 What can't you do?

Some of these functions are **unsafe to reimplement in pure Luau**:

- Do **not** attempt to reimplement [`#!luau fireclickdetector`](./fireclickdetector.md), [`#!luau fireproximityprompt`](./fireproximityprompt.md), or [`#!luau firetouchinterest`](./firetouchinterest.md) manually in Luau - doing so risks detection and unexpected behavior.
- Some values like the hidden UI container returned by [`#!luau gethui`](./gethui.md) are intentionally cloaked and should not be searched using normal property iteration.
