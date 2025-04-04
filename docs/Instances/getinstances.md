# `getinstances`

!!! info "Includes all memory-tracked instances"

    `#!luau getinstances` should be able to return [instances](https://create.roblox.com/docs/reference/engine/classes/Instance) outside of [`game`](https://create.roblox.com/docs/reference/engine/classes/DataModel).

`#!luau getinstances` retrieves **every [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance)** currently referenced by the client, including those outside the [`#!luau game`](https://create.roblox.com/docs/reference/engine/classes/DataModel) hierarchy or parented to `nil`.

This is useful for locating objects that are hidden, cloaked, or otherwise inaccessible via regular traversal methods like [`#!luau game:GetDescendants()`](https://create.roblox.com/docs/reference/engine/classes/Instance#GetDescendants).

```luau
function getinstances(): { Instance }
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Finding a nil-parented instance" linenums="1"
local DummyPart = Instance.new("Part")
DummyPart.Parent = nil

for _, instance in pairs(getinstances()) do
    if instance == DummyPart then
        print("Found the dummy part!")
    end
end
```
