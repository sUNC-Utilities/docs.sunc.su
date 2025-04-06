# `getconnections`

!!! info "C and foreign signals"

    Passing a signal that originates from [CoreScripts](https://robloxapi.github.io/ref/class/CoreScript.html), [Actors](https://create.roblox.com/docs/reference/engine/classes/Actor), or is otherwise made in C, will return a valid [`Connection`](./Connection.md) object - but its `#!luau Function` and `#!luau Thread` properties will be `#!luau nil`.

`#!luau getconnections` retrieves a list of [`Connection`](./Connection.md) objects currently attached to a given [`RBXScriptSignal`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal).


```luau
function getconnections(signal: RBXScriptSignal): {Connection}
```

## Parameters

| Parameter         | Description                                   |
|-------------------|-----------------------------------------------|
| `#!luau signal`     | The signal to inspect for active connections. |

---

## Example

```luau title="Inspecting and invoking a Luau connection" linenums="1"
local folder = Instance.new("Folder")
folder.ChildAdded:Connect(function()
    return "Triggered"
end)

local connection = getconnections(folder.ChildAdded)[1] -- First connection in the list
print(connection.Function())     -- Output: Triggered
connection:Fire() -- Same as above, Output: Triggered
print(typeof(connection.Thread)) -- Output: thread
```

---

## Example 2

```luau title="Accessing a foreign/C connection" linenums="1"
local cconnection = getconnections(game.Players.LocalPlayer.Idled)[1]
print(cconnection.Function)  -- Output: nil
print(cconnection.Thread)    -- Output: nil
```
