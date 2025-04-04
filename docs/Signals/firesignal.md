# `firesignal`

`#!luau firesignal` manually invokes all Lua-based [`RBXScriptConnection`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection) objects connected to a given [`RBXScriptSignal`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal), passing the provided arguments.

This behaves similarly to what Roblox itself would do when the signal is triggered by the engine - except you control when and how it is fired.

```luau
function firesignal(signal: RBXScriptSignal, ...: any?)
```

## Parameters

| Parameter         | Description                                            |
|------------------|--------------------------------------------------------|
| `#!luau signal`    | The signal whose connections you want to manually fire. |
| `#!luau ...`       | The arguments to pass to the connected functions.       |

---

## Example

```luau title="Manually firing a signal with and without arguments" linenums="1"
local part = Instance.new("Part")

part.ChildAdded:Connect(function(arg1)
    print(typeof(arg1))
end)

firesignal(part.ChildAdded)            -- Output: nil
firesignal(part.ChildAdded, workspace) -- Output: Instance
```
