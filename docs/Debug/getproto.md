# `debug.getproto`

!!! warning "C closures not supported"
    This function will throw an error if called on a C closure, such as [`#!luau print`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#print), since C closures do not contain Luau function prototypes.

`#!luau debug.getproto` returns a specific function prototype from a Luau function by index. Optionally, it can search for **active instances** of the prototype (functions currently in memory) if the `#!luau activated` parameter is set to `true`.

```luau
function debug.getproto(func: (...any) -> (...any) | number, index: number, activated: boolean?): (...any) -> (...any) | { (...any) -> (...any) }
```

## Parameters

| Parameter           | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `#!luau func`        | The Lua function (or stack level) to extract a proto from.                  |
| `#!luau index`       | The index of the prototype to return.                                       |
| `#!luau activated?`  | If `true`, returns a table of currently active functions based on the proto. |

---

## Examples

### Example 1

```luau title="Retrieving nested prototypes" linenums="1"
local function DummyFunction()
    local function DummyProto1()
        print("Hello")
    end
    local function DummyProto2()
        print("Hello2")
    end
end

debug.getproto(DummyFunction, 1)() -- Output: Hello
debug.getproto(DummyFunction, 2)() -- Output: Hello2
```

### Example 2

```luau title="Retrieving an active function from a proto" linenums="1"
local function DummyFunction()
    local function DummyProto()
        return "hi"
    end
    return DummyProto
end

local RealProto = DummyFunction()
local RetrievedProto = debug.getproto(DummyFunction, 1, true)[1]

print(RealProto == RetrievedProto) -- Output: true
print(RetrievedProto()) -- Output: hi
```
