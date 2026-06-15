# `getscriptfromthread`

!!! info "Notes on `#!luau getscriptfromthread`"

    This function should return the script associated with the thread, regardless of any mutations made to itself or its environment.

    This also includes threads whose [`#!luau script` global variable](https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals#script) is set to `#!luau nil` or reassigned - i.e. `#!luau getscriptfromthread` should still return said script.
    `#!luau getscriptfromthread` should use the script reference stored on the thread itself, not the thread environment's `#!luau script` value. This reference is weak, so it should not keep the script alive.

!!! info "Returns `#!luau nil` when no script is associated"

    If the given thread has no associated [`#!luau Script`](https://create.roblox.com/docs/reference/engine/classes/Script), [`#!luau LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript), or [`#!luau ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript), this function should return `#!luau nil`.

    This includes executor-created threads. If the thread's weak script reference no longer points to a live script, such as after the script is garbage collected, this function should also return `#!luau nil`.

`#!luau getscriptfromthread` returns the [`#!luau Script`](https://create.roblox.com/docs/reference/engine/classes/Script), [`#!luau LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript), or [`#!luau ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript) associated with a given [Luau thread](https://create.roblox.com/docs/reference/engine/libraries/coroutine#running).

```luau
function getscriptfromthread(thread: thread): BaseScript | ModuleScript | nil
```

## Parameters

| Parameter       | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| `#!luau thread` | The Luau thread whose associated script should be retrieved. |

---

## Example

```luau title="Resolving the script associated with a calling thread" linenums="1"
local old; old = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() then
        local current_thread = coroutine.running()
        local thread_script = getscriptfromthread(current_thread)

        warn("__index access from:", thread_script and thread_script:GetFullName() or "Unknown")

        hookmetamethod(game, "__index", old) -- restore the original
        return old(self, key)
    end

    return old(self, key)
end)

print(getscriptfromthread(coroutine.running())) -- output: nil, because this is an executor thread
```
