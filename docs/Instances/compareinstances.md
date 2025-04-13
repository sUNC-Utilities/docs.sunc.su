# `compareinstances`

`#!luau compareinstances` Returns whether the provided objects A and B both reference the same Instance.

```luau
function compareinstances(A: Instance, B: Instance): boolean
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau A` | The first Instance to compare |
| `#!luau B` | The second Instance to compare |

---

## Example

```luau title="Comparing instances" linenums="1"
local Lighting = game:GetService("Lighting")
local LightingClone = cloneref(Lighting)

print(Lighting == LightingClone) --> false
print(compareinstances(Lighting, LightingClone)) --> true
```
