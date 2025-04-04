# `getgenv`

!!! info "Do not confuse with [`#!luau getrenv`](./getrenv.md) or [`#!luau getsenv`](../Scripts/getsenv.md)."

`#!luau getgenv` returns the **executor's global environment table**, which is shared across all scripts running within the same executor context.

This environment is writable and persistent during the session, making it useful for sharing state or functions across different scripts.

```luau
function getgenv(): { any }
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Storing values across scripts using getgenv" linenums="1"
getgenv().sharedVar = "hello world"

task.spawn(function()
    print(sharedVar) -- Output: hello world
end)
```
