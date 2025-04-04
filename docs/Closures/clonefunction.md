# `clonefunction`

!!! info "`#!luau clonefunction` Notes"

    The new (cloned) function returned by `#!luau clonefunction` should have the same environment as the original function.

    Any sort of modification to the original function **should not** affect the clone. This means that stuff like hooking the original function will leave the clone **unaffected**.

`#!luau clonefunction` creates and returns a new function that has the exact same behaviour as the passed function, but gives it another identity.

For example, performing [`#!luau tostring`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#tostring) on a new function returned by `#!luau clonefunction` would give you a different address from when you perform [`#!luau tostring`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#tostring) on your original function.

```luau
function clonefunction<A..., R...>(function_to_clone: (A...) -> R...): (A...) -> R...
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau function_to_clone` | The function to clone. |

---

## Example

```luau title="Cloning functions with clonefunction" linenums="1"
local function DummyFunction()
    print("Hello")
end

local ClonedFunction = clonefunction(DummyFunction)

print(debug.info(ClonedFunction, "l")) -- Output: 1
print(debug.info(ClonedFunction, "n")) -- Output: DummyFunction
print(ClonedFunction == DummyFunction) -- Output: false
print(getfenv(ClonedFunction) == getfenv(DummyFunction)) -- Output: true

```
