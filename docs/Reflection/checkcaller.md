# `checkcaller`

`#!luau checkcaller` returns a boolean indicating whether the **current function was invoked from the executor's own thread**. This is useful for differentiating between your own calls and those made by the game or other systems.

It is often used in [`#!luau hookfunction`](../Closures/hookfunction.md) or [`#!luau hookmetamethod`](../Closures/hookmetamethod.md) setups to distinguish executor logic from internal game logic.

```luau
function checkcaller(): boolean
```

## Parameters

| Parameter | Description        |
|-----------|--------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Identifying the source of a __namecall" linenums="1"
local FromCaller

local original; original = hookmetamethod(game, "__namecall", function(...)
    if FromCaller == nil then
        FromCaller = checkcaller()
    end

    return original(...)
end)

task.wait(0.1) -- step a bit
hookmetamethod(game, "__namecall", original)

print(FromCaller)       -- Output: false (if triggered by the game)
print(checkcaller())    -- Output: true (from executor thread)
```
