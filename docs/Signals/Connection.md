# The `Connection` object

!!! info Notes on the `object`.
    
    The retrieved connection object will only have the listed methods and fields, since it's a custom object

A `#!luau Connection` object represents an active link to a signal's callback. These are returned by [`#!luau getconnections`](./getconnections.md) and allow inspection and manipulation over connections/signals.

---

## Fields

| Field               | Type        | Description                                                                 |
|---------------------|-------------|-----------------------------------------------------------------------------|
| `#!luau Enabled`       | `boolean`   | Whether the connection is currently active and will respond to events.     |
| `#!luau ForeignState`  | `boolean`   | `#!luau true` if the connection was made from a foreign Lua state (e.g. CoreScript). |
| `#!luau LuaConnection` | `boolean`   | `#!luau true` if the connection was created from Luau, not C or foreign code.        |
| `#!luau Function`      | `function?` | The bound function, or `#!luau nil` if foreign or non-Luau.                        |
| `#!luau Thread`        | `thread?`   | The thread that created the connection, or `#!luau nil` in foreign contexts.       |

!!! info "Foreign and C-state behavior"

    If the connection originates from a foreign Lua state or is a C-level connection, `#!luau Function` and `#!luau Thread` will be `#!luau nil`, due to these fields being impossible to obtain in this scenario.

---

## Methods

| Method Signature                           | Description                                                     |
|--------------------------------------------|-----------------------------------------------------------------|
| `#!luau Connection:Fire(...: any): ()`       | Fires the connected function with given arguments. |
| `#!luau Connection:Defer(...: any): ()`      | Defers execution using [`#!luau task.defer`](https://create.roblox.com/docs/reference/engine/libraries/task#defer).     |
| `#!luau Connection:Disconnect(): ()`         | Disconnects the connection from the signal.                    |
| `#!luau Connection:Disable(): ()`            | Prevents the connection from receiving events.                 |
| `#!luau Connection:Enable(): ()`             | Re-enables a previously disabled connection.                   |
