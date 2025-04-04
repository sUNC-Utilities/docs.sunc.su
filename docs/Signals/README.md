# Signals

The **Signals** library provides functions for inspecting, manipulating, and simulating Roblox's [`RBXScriptSignal`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal) and [`RBXScriptConnection`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection) objects.

This library gives you visibility into active connections, their properties, and even allows custom invocation or replication of signals - functionality not available in standard Luau.

---

## 🧠 What is a signal?

A [signal](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal) in Roblox is an event emitter - an object that can have functions connected to it, which are triggered when something happens. For example, [`Part.Touched`](https://create.roblox.com/docs/reference/engine/classes/BasePart#Touched) is a signal that fires when something touches a part.

Signals are backed by objects called **connections**, which are instances of [`RBXScriptConnection`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection). Each connection tracks its state, the function it will call, and how it should behave.

For more information on how connections behave internally, see the [`#!luau Connection` Object](./Connection.md) documentation.

---

## 🚦 What can you do?

With the Signals library, you can:

- **Get all connections** attached to a signal using [`#!luau getconnections`](./getconnections.md)
- **Manually fire** a signal's Lua-connected callbacks using [`#!luau firesignal`](./firesignal.md)
- **Simulate remote signal replication** with [`#!luau replicatesignal`](./replicatesignal.md), if supported by the signal

---

## 🚫 What can't you do?

There are natural limitations to how signals work:

- You cannot view or invoke **foreign** or **C-bound signals**, such as internal CoreScript events.
- Some signals **require valid argument structures** or **specific execution contexts**, which may lead to argument mismatches or errors.
- Replication behavior is **executor-specific** and may not match Roblox's internal rules perfectly.

For a list of known replicable signals, check out [this Rubiš viewer listing](https://rubis.numelon.com/view/?scrap=AIOzG1Di7NSLADKE).
