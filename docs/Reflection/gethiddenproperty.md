# `gethiddenproperty`

!!! warning "Avoid relying on [`#!luau setscriptable`](./setscriptable.md) backends"

    Some executors implement [`#!luau gethiddenproperty`](./gethiddenproperty.md) using [`#!luau setscriptable`](./setscriptable.md), which can be limited or detectable. This function should instead access the property directly for reliability and stealth.

`#!luau gethiddenproperty` retrieves the value of a hidden or non-scriptable property (e.g. `BinaryString`, `SharedString`, `SystemAddress`) from a given [`Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance), even if it would normally throw an error when accessed directly.

This function also returns whether the accessed property was hidden.

```luau
function gethiddenproperty(instance: Instance, property_name: string): (any, boolean)
```

## Parameters

| Parameter             | Description                                           |
|-----------------------|-------------------------------------------------------|
| `#!luau instance`       | The [instance](https://create.roblox.com/docs/reference/engine/classes/Instance) containing the hidden property.          |
| `#!luau property_name`  | The name of the property to access.                   |

---

## Example

```luau title="Reading a hidden property" linenums="1"
local part = Instance.new("Part")

print(gethiddenproperty(part, "Name"))       -- Output: Part, false
print(gethiddenproperty(part, "DataCost"))   -- Output: 20, true
```
