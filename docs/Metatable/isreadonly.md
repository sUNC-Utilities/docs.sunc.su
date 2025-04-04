# `isreadonly`

`#!luau isreadonly` checks whether a table is currently set as **readonly** (immutable).

This is helpful when you want to confirm whether a table can be modified, especially after calling [`#!luau setreadonly`](./setreadonly.md).

```luau
function isreadonly(table: { any }): boolean
```

## Parameters

| Parameter        | Description                             |
|------------------|-----------------------------------------|
| `#!luau table`   | The table to check for readonly status. |

---

## Example

```luau title="Checking if a table is readonly" linenums="1"
print(isreadonly({})) -- Output: false
print(isreadonly(getrawmetatable(game))) -- Output: true
```
