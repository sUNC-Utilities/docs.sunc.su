# `debug.getstack`

`#!luau debug.getstack` retrieves one or more values from the stack at the specified call level.

This function is useful for inspecting local variables or arguments at different layers of the call stack. If no index is given, all values at that stack level are returned as a list.

```luau
function debug.getstack(level: number, index: number?): any | { any }
```

## Parameters

| Parameter         | Description                                                       |
|-------------------|-------------------------------------------------------------------|
| `#!luau level`     | The stack level to inspect. `1` is the current function.          |
| `#!luau index?`    | (Optional) The specific slot/index at that stack level to read.   |

---

## Examples

### Example 1

```luau title="Retrieving multiple values from the stack" linenums="1"
local Count = 0

local function RecursiveFunction()
    Count += 1
    if Count > 6 then return end

    local a = 29
    local b = true
    local c = "Example"
    a += 1
    b = false
    c ..= "s"

    print(debug.getstack(1, Count))
    RecursiveFunction()
end

RecursiveFunction()
-- Output (varies depending on Count):
-- 30
-- false
-- Examples
-- function: 0x... (print)
-- function: 0x... (getstack)
-- etc.
```

### Example 2

```luau title="Retrieving values from the caller's stack" linenums="1"
local function DummyFunction()
    return "Hello"
end

local Var = 5
Var += 1

(function()
    print(debug.getstack(2)[1]()) -- Output: Hello
    print(debug.getstack(2)[2])   -- Output: 6
end)()
```
