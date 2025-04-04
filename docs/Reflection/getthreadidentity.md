# `getthreadidentity`

`#!luau getthreadidentity` retrieves the current [security context level](./ThreadIdentity.md) (also called *thread identity*) of the running [Luau thread](https://create.roblox.com/docs/reference/engine/libraries/coroutine#running).

This is useful when you need to verify your execution level before accessing protected APIs or restoring the original identity after calling [`#!luau setthreadidentity`](./setthreadidentity.md).

```luau
function getthreadidentity(): number
```

## Parameters

| Parameter  | Description                        |
|------------|------------------------------------|
| *(none)*   | This function takes no parameters. |

---

## Example

```luau title="Checking thread identity across defer" linenums="1"
task.defer(function()
    setthreadidentity(2)
    print(getthreadidentity()) -- Output: 2
end)

setthreadidentity(3)
print(getthreadidentity())     -- Output: 3
```
