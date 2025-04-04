# `iscclosure`

`#!luau iscclosure` checks whether a given function is a C closure or not.

```luau
function iscclosure(func: (...any) -> (...any)): boolean
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau func` | The function to check. |

---

## Example

```luau title="Checking whether functions are C closures with iscclosure" linenums="1"
local function DummyLuaFunction()
    print("This is an executor Lua closure")
end

local DummyCFunction = newcclosure(function()
    print("This is an Executor C Closure")
end)

local DummyStandardCFunction = print
local DummyGlobalCFunction = getgc

print(iscclosure(DummyCFunction)) -- Output: true
print(iscclosure(DummyGlobalCFunction)) -- Output: true
print(iscclosure(DummyStandardCFunction)) -- Output: true
print(iscclosure(DummyLuaFunction)) -- Output: false
```
