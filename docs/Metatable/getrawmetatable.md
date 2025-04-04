# `getrawmetatable`

`#!luau getrawmetatable` returns the raw metatable of an object, even if that object has a locked `#!luau __metatable` field.

This function is useful for hooking Roblox objects that normally do not expose their metatables through standard means.

```luau
function getrawmetatable(object: any): { [any]: any }
```

## Parameters

| Parameter        | Description                              |
|------------------|------------------------------------------|
| `#!luau object`  | The object whose metatable to retrieve.  |

---

## Example

```luau title="Getting the metatable of a Roblox object" linenums="1"
local mt = getrawmetatable(game)
print(mt.__index(game, "Workspace")) -- Output: Workspace
```
