# `isexecutorclosure`

`#!luau isexecutorclosure` checks whether a given function is a closure of the executor.

```luau
function isexecutorclosure(func: (...any) -> (...any)): boolean
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau func` | The function to check. |

---

## Example

```luau title="Identifying executor closures with isexecutorclosure" linenums="1"
local function DummyLuaFunction()
    print("This is an executor Lua closure")
end

local DummyCFunction = newcclosure(function()
    print("This is an executor C closure")
end)

local DummyStandardCFunction = print
local DummyGlobalCFunction = getgc

print(isexecutorclosure(DummyLuaFunction)) -- Output: true
print(isexecutorclosure(DummyCFunction)) -- Output: true
print(isexecutorclosure(DummyGlobalCFunction)) -- Output: true
print(isexecutorclosure(DummyStandardCFunction)) -- Output: false
```
