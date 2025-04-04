# `debug.getupvalues`

!!! warning "C closures not supported"
    This function will throw an error if called on a C closure, such as [`#!luau print`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#print), since C closures do not expose upvalues.

`#!luau debug.getupvalues` returns a list of upvalues captured by a Luau function. These are the external variables that a function closes over from its surrounding scope.

If the function has no upvalues, the result will be an empty table.

```luau
function debug.getupvalues(func: (...any) -> (...any) | number): { any }
```

## Parameters

| Parameter        | Description                                                        |
|------------------|--------------------------------------------------------------------|
| `#!luau func`     | The Lua function (or stack level) to retrieve upvalues from.       |

---

## Examples

### Example 1

```luau title="Retrieving upvalues from a closure" linenums="1"
local Var1 = false
local Var2 = "Hi"

local function DummyFunction()
    Var1 = true
    Var2 ..= ", hello"
end

for index, value in pairs(debug.getupvalues(DummyFunction)) do
    print(index, value)
end

-- Output:
-- 1 false
-- 2 Hi
```

### Example 2

```luau title="Calling with a function that has no upvalues" linenums="1"
local function DummyFunction()
    return 123
end

print(next(debug.getupvalues(DummyFunction))) -- Output: nil
```

### Example 3

```luau title="Calling on a C closure should error" linenums="1"
print(debug.getupvalues(print)) -- Should error due to being a C closure
```
