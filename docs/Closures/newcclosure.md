# `newcclosure`

!!! failure "Do not implement this with coroutines"

    Many executors seem to be implementing this function using [`#!luau coroutine`](https://create.roblox.com/docs/reference/engine/libraries/coroutine) functions in Luau. Such functions **will not pass sUNC checks**.

    The wrapped function **must** be yieldable, meaning that the function should be able to call [`#!luau task.wait`](https://create.roblox.com/docs/reference/engine/libraries/task#wait), for example.

`#!luau newcclosure` takes any Luau function and wraps it into a C closure.

When the returned function is called, the original Luau closure is called, and arguments are passed to the original closure, and then the returned arguments of the original closure are passed to the caller of the C closure.

```luau
function newcclosure<A..., R...>(function_to_wrap: (A...) -> R...): (A...) -> R...
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau function_to_wrap` | A function to be wrapped. |

---

## Examples

### Example 1

```luau title="Basic C closure wrapping example with newcclosure" linenums="1"
local DummyFunction = function(...)
    return ...
end

print(iscclosure(DummyFunction)) -- Output: false

local WrappedFunction = newcclosure(DummyFunction)

print(iscclosure(WrappedFunction)) -- Output: true

local FunctionResults = WrappedFunction("Hello")
print(FunctionResults) -- Output: Hello
```

### Example 2

This example illustrates how Lua functions wrapped as a C closure should also be yieldable, therefore also showcasing how coroutine implementations of `#!luau newcclosure` would fail.

```luau title="Yieldable C functions made with newcclosure" linenums="1"
local DummyYieldingFunction = newcclosure(function()
    print("Before")
    task.wait(1.5)
    print("After")
end)

DummyYieldingFunction()
-- Output:
-- Before
-- yield for 1.5 seconds
-- After
```
