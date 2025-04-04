# `getnilinstances`

!!! info "Returns only nil-parented instances"

    `#!luau getnilinstances` filters the full instance list to return only those whose [`Parent`](https://create.roblox.com/docs/reference/engine/classes/Instance#Parent) is explicitly set to `#!luau nil`.

`#!luau getnilinstances` returns a list of [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) objects that are **currently unparented**. These instances exist in memory but are no longer part of the [`#!luau game`](https://create.roblox.com/docs/reference/engine/classes/DataModel) hierarchy.

This function is especially useful for detecting deleted or hidden objects that have not yet been garbage collected.

```luau
function getnilinstances(): { Instance }
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Detecting a detached part" linenums="1"
local part = Instance.new("Part")

-- this line isn't required because we already did Instance.new() without supplying the second argument
-- however, for the sake of a visual example, we manually set it to nil
part.Parent = nil

for _, instance in pairs(getnilinstances()) do
    if instance == part then
        print("Found our detached part!")
    end
end
```
