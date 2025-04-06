# `getrawmetatable`

`#!luau getrawmetatable` returns the raw metatable of an object, even if that object has a `#!luau __metatable` field set.


```luau
function getrawmetatable(object: any): { [any]: any }
```

## Parameters

| Parameter        | Description                              |
|------------------|------------------------------------------|
| `#!luau object`  | The object whose metatable to retrieve.  |

---

## Example

```luau title="Getting the metatable of the DataModel" linenums="1"
local mt = getrawmetatable(game)
print(mt.__index(game, "Workspace")) -- Output: Workspace
```
