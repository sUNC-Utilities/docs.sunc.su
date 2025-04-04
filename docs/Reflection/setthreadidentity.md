# `setthreadidentity`

`#!luau setthreadidentity` sets the current [Luau thread](https://create.roblox.com/docs/reference/engine/libraries/coroutine#running) identity to a specific [security context level](./ThreadIdentity.md). Higher identities grant access to more privileged operations like reading CoreGui or modifying protected instances.

This is commonly used alongside functions like [`#!luau gethiddenproperty`](./gethiddenproperty.md) or [`#!luau getconnections`](../Signals/getconnections.md) which may require elevated access.

```luau
function setthreadidentity(id: number): ()
```

## Parameters

| Parameter         | Description                                                      |
|-------------------|------------------------------------------------------------------|
| `#!luau id`         | The identity level to set the current thread to (e.g. `2`, `8`). |

---

## Example

```luau title="Changing thread identity for privileged access" linenums="1"
setthreadidentity(2)
print(pcall(function() return game.CoreGui end)) -- Output: false (restricted access)

setthreadidentity(8)
print(pcall(function() return game.CoreGui end)) -- Output: true Instance
```
