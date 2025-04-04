# `setreadonly`

`#!luau setreadonly` sets whether a table is **readonly** (immutable) or **writable** (mutable).

By default, many internal metatables such as [`#!luau getrawmetatable(game)`](./getrawmetatable.md) are locked using the `#!luau __metatable` field, making them immutable. This function bypasses that restriction and toggles their readonly status.

```luau
function setreadonly(table: { any }, state: boolean): ()
```

## Parameters

| Parameter        | Description                                              |
|------------------|----------------------------------------------------------|
| `#!luau table`   | The table whose readonly status you want to modify.     |
| `#!luau state`   | `#!luau true` to lock the table, `#!luau false` to unlock it.         |

---

## Example

```luau title="Unlocking a metatable" linenums="1"
local mt = getrawmetatable(game)
mt.Example = "Hello" -- Throws an error

setreadonly(mt, false)
mt.Example = "Hello" -- Works
print(mt.Example) -- Output: Hello

setreadonly(mt, true) -- Lock it again

```
