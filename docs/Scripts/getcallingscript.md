# `getcallingscript`

!!! info "Only returns `#!luau nil` for executor threads"

    If a script is executing in a game thread, `#!luau getcallingscript()` must return the proper [`Script`](https://create.roblox.com/docs/reference/engine/classes/Script), [`LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript), or [`ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript) - even if it has set its global [`#!luau script`](https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals#script) variable to `#!luau nil`.

`#!luau getcallingscript` returns the [`#!luau Script`](https://create.roblox.com/docs/reference/engine/classes/Script), [`#!luau LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript), or [`#!luau ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript) that **triggered the current code execution** - provided the call originated from the game.

For executor threads, this will always return `#!luau nil`.

```luau
function getcallingscript(): Script | LocalScript | ModuleScript | nil
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Detecting the calling script in a hook" linenums="1"
local old; old = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() then
        local caller = getcallingscript()
        warn("__index access from script:", caller and caller:GetFullName() or "Unknown")

        hookmetamethod(game, "__index", old) -- restore ze original
        return old(self, key)
    end

    return old(self, key) -- ensure executor access still works after ts
end)

print(getcallingscript()) -- Output: nil bc called from executor thread

```
