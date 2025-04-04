# The `Connection` Object

A `#!luau Connection` object represents an active link to a signal's callback. These are returned by [`#!luau getconnections`](./getconnections.md) and allow low-level inspection and manipulation of how signals are handled.

Connections may originate from different sources, such as [CoreScripts](https://robloxapi.github.io/ref/class/CoreScript.html), [Actors](https://create.roblox.com/docs/reference/engine/classes/Actor), or your own [scripts](https://create.roblox.com/docs/reference/engine/classes/Script). Each connection exposes several properties and methods.

---

## Fields

| Field               | Type        | Description                                                                 |
|---------------------|-------------|-----------------------------------------------------------------------------|
| `#!luau Enabled`       | `boolean`   | Whether the connection is currently active and will respond to events.     |
| `#!luau ForeignState`  | `boolean`   | True if the connection was made from a foreign Lua state (e.g. CoreScript). |
| `#!luau LuaConnection` | `boolean`   | True if the connection was created from Luau, not C or foreign code.        |
| `#!luau Function`      | `function?` | The bound function, or `nil` if foreign or non-Luau.                        |
| `#!luau Thread`        | `thread?`   | The thread that created the connection, or `nil` in foreign contexts.       |

!!! info "Foreign and C-state behavior"

    If the connection originates from a foreign Lua state or is a C-level connection, `#!luau Function` and `#!luau Thread` will be `#!luau nil`. This is expected and intended.

---

## Methods

| Method Signature                           | Description                                                     |
|--------------------------------------------|-----------------------------------------------------------------|
| `#!luau Connection:Fire(...: any): ()`       | Immediately fires the connected function with given arguments. |
| `#!luau Connection:Defer(...: any): ()`      | Defers execution using [`#!luau task.defer`](https://create.roblox.com/docs/reference/engine/libraries/task#defer).     |
| `#!luau Connection:Disconnect(): ()`         | Disconnects the connection from the signal.                    |
| `#!luau Connection:Disable(): ()`            | Prevents the connection from receiving events.                 |
| `#!luau Connection:Enable(): ()`             | Re-enables a previously disabled connection.                   |

---

## Example

```luau title="Inspect and fire a signal connection" linenums="1"
local part = Instance.new("Part")

part.AncestryChanged:Connect(function(parent, child)
    print("Connection triggered:", parent, child)
end)

local connection = getconnections(part.AncestryChanged)[1]

print(connection.Function)   -- Output: function: 0x...
print(connection.Thread)     -- Output: thread

connection:Fire(nil, nil)    -- Output: Connection triggered: nil nil
```
