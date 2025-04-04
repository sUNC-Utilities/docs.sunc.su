# `getcallbackvalue`

`#!luau getcallbackvalue` retrieves the **function assigned to a callback property** on an [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance), such as [`#!luau OnInvoke`](https://create.roblox.com/docs/reference/engine/classes/BindableFunction#OnInvoke) or [`#!luau OnServerInvoke`](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction#OnServerInvoke).

Normally, these properties are **write-only**, meaning you can assign a function to them but cannot read them back. This function bypasses that limitation and exposes the function directly.

```luau
function getcallbackvalue(object: Instance, property: string): (...any) -> (...any)
```

## Parameters

| Parameter           | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `#!luau object`       | The [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) that owns the callback property. |
| `#!luau property`     | The name of the callback property to retrieve (e.g. `"OnInvoke"`).         |

---

## Notes

- This function **throws an error** if the callback does not exist or is unset.
- Some instances (like [`#!luau RemoteFunction`](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction)) may restrict access to their callbacks depending on context (e.g., trying to read [`#!luau OnClientInvoke`](https://create.roblox.com/docs/reference/engine/classes/RemoteFunction#OnClientInvoke) from the client).

---

## Example

```luau title="Retrieving a callback function" linenums="1"
local bf = Instance.new("BindableFunction")

bf.OnInvoke = function()
    print("Hello from callback!")
end

local retrieved = getcallbackvalue(bf, "OnInvoke")
retrieved() -- Output: Hello from callback!
```
