# `hookmetamethod`

!!! info "`#!luau hookmetamethod` zupens"

    `#!luau hookmetamethod` can be safely implemented from within Luau, **as long as [`#!luau hookfunction`](./hookfunction.md) is already properly implemented in C**.

    !!! warning "Implementing in Luau"

        Despite the fun fact above, we heavily discourage implementing ***anything*** in just Luau - even if it seems like something as trivial as `#!luau hookmetamethod`, which is essentially a specialised wrapper for [`#!luau hookfunction`](./hookfunction.md).

`#!luau hookmetamethod` takes any Luau object that can have a metatable, and attempts to hook the specified metamethod of the object. Internally, it essentially uses [`#!luau hookfunction`](./hookfunction.md) to hook specific metamethods.

```luau
function hookmetamethod(object: table | Instance | userdata, metamethod_name: string, hook: (...any) -> (...any)): (...any) -> (...any)
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau object` | The object which has a metatable. |
| `#!luau metamethod_name` | The name of the metamethod to hook. |
| `#!luau hook` | The function that will be used as a hook. |

---

## Example

```luau title="Easily hooking metamethods with hookmetamethod" linenums="1"
local Original; Original = hookmetamethod(game, "__index", function(...)
    local Key = select(2, ...)
    print(Key)
    return Original(...)
end)

local _ = game.PlaceId
hookmetamethod(game, "__index", Original) -- Restores game's __index

-- Output: PlaceId
```
