# `debug.getconstant`

!!! warning "C closures not supported"
    This function will throw an error if called on a C closure, such as [`#!luau print`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#print), since C closures have no accessible constants.

`#!luau debug.getconstant` returns the constant at the specified index from a Luau function's bytecode. If no constant exists at that index, it returns `#!luau nil`.

This is useful when you want to inspect specific constant values (such as strings, numbers, or booleans) without dumping the entire list.

```luau
function debug.getconstant(func: (...any) -> (...any) | number, index: number): number | string | boolean | nil
```

## Parameters

| Parameter        | Description                                                  |
|------------------|--------------------------------------------------------------|
| `#!luau func`     | The Lua function (or stack level) whose constant to retrieve.|
| `#!luau index`    | The position of the desired constant.                        |

---

## Examples

### Example 1

```luau title="Getting a valid constant" linenums="1"
local function DummyFunction()
    local DummyString = "foo bar"
    string.split(DummyString, " ")
end

local Result = debug.getconstant(DummyFunction, 2)
print(Result) -- Output: string
```

### Example 2

```luau title="Getting an out-of-range constant" linenums="1"
local function DummyFunction()
    local DummyString = "foo bar"
    string.split(DummyString, " ")
end

local Result = debug.getconstant(DummyFunction, 3)
print(Result) -- Output: nil
```

### Example 3

```luau title="Calling on a C closure should error" linenums="1"
print(debug.getconstant(print, 1)) -- Should error due to being a C closure
```
