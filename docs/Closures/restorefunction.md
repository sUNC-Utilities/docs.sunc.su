# `restorefunction`

`#!luau restorefunction` restores the given function to it's unhooked state.

!!! warning "Restoring an unhooked function"

    This function will throw an error if called on a function that has not been hooked.


```luau
function restorefunction(functionToRestore: (...any) -> (...any)): ()
```

## Parameters

| Parameter        | Description                                              |
|------------------|----------------------------------------------------------|
| `#!luau functionToRestore`   | The hooked function that you want to restore     |

---

## Examples

### Example 1

```luau title="Restoring a hooked function" linenums="1"
function dummy_func()
    print("I am not hooked!")
end

hookfunction(dummy_func, function()
    print("I am hooked!")
end)

dummy_func() -- Output: I am hooked!
restorefunction(dummy_func)
dummy_func() -- Output: I am not hooked!

```

### Example 2

```luau title="Restoring a unhooked function" linenums="1"
function dummy_func()
    print("I am not hooked!")
end

dummy_func() -- Output: I am not hooked!
restorefunction(dummy_func) -- Error: restorefunction: function is not hooked

```
