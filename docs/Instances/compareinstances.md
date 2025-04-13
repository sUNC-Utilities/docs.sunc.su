# `compareinstances`

`#!luau compareinstances` returns whether the provided objects A and B both reference the same Instance.

```luau
function compareinstances(A: Instance, B: Instance): boolean
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau A` | The first [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) to compare |
| `#!luau B` | The second [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) to compare |

---

## Example

```luau title="Comparing instances" linenums="1"
local Lighting = game:GetService("Lighting")
local LightingClone = cloneref(Lighting)

print(Lighting == LightingClone) --> false
print(compareinstances(Lighting, LightingClone)) --> true
```
