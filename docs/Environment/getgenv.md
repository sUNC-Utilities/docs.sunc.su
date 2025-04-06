# `getgenv`

!!! warning "getgenv polluting"
    Modifications to a thread's global environment should not affect `getgenv`.

`#!luau getgenv` returns the **executor's global environment table**, which is shared across all executor-made threads.

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
getgenv().shared_var = "hello world"

task.spawn(function()
    print(shared_var) -- Output: hello world
end)
```
