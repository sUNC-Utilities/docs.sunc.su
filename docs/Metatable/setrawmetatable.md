# `setrawmetatable`

`#!luau setrawmetatable` forcibly sets the metatable of a value, bypassing the `#!luau __metatable` protection field.

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
local dummy_string = "Example"
local string_metatable = setrawmetatable(dummy_string, {
    __index = getgenv()
})

print(string_metatable)          -- Output: Example
print(string_metatable.getgenv)        -- Output: function: 0x...
```
