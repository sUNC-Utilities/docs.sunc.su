# `setrawmetatable`

`#!luau setrawmetatable` forcibly sets the metatable of a value, bypassing the `#!luau __metatable` protection field.

This is typically used when overriding or injecting behavior into Roblox objects or tables that would otherwise restrict modification.

```luau
function setrawmetatable<T>(object: T, metatable: { any }): T
```

## Parameters

| Parameter          | Description                                      |
|--------------------|--------------------------------------------------|
| `#!luau object`     | The value whose metatable will be overwritten.  |
| `#!luau metatable`  | The new metatable to assign.                    |

---

## Example

```luau title="Overriding the metatable of a string" linenums="1"
local DummyString = "Example"
local StringMetatable = setrawmetatable(DummyString, {
    __index = getgenv()
})

print(StringMetatable)          -- Output: Example
print(Metatable.getgenv)        -- Output: function: 0x...
```
