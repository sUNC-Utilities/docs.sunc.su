# `debug.setstack`

`#!luau debug.setstack` replaces a value in a specified call stack frame.

This allows for powerful manipulation of runtime variables or arguments, particularly useful in advanced debugging or dynamic patching scenarios.

```luau
function debug.setstack(level: number, index: number, value: any): ()
```

## Parameters

| Parameter         | Description                                                           |
|-------------------|-----------------------------------------------------------------------|
| `#!luau level`     | The stack level to target. `1` refers to the current function.         |
| `#!luau index`     | The index/slot in the stack frame to replace.                         |
| `#!luau value`     | The new value to assign at that stack slot.                           |

---

## Examples

### Example 1

```luau title="Replacing a function on the stack" linenums="1"
error(debug.setstack(1, 1, function()
    return function()
        print("Replaced")
    end
end))() -- Output: Replaced
```

### Example 2

```luau title="Replacing a numeric local in a parent scope" linenums="1"
local OuterValue = 10

local function InnerFunction()
    OuterValue += 9
    debug.setstack(2, 1, 100)
end

InnerFunction()
print(OuterValue) -- Output: 100
```
