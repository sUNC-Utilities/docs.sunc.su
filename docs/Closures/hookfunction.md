# `hookfunction`

!!! info "Notes on `#!luau hookfunction`"

    The hook should not have more upvalues than the function you want to hook.

    All possible hooking closure pairs should be supported throughout L, NC, C (where NC = [`#!luau newcclosure`](./newcclosure.md))

`#!luau hookfunction` allows you to hook a function with another wanted function, returning the original unhooked function.

```luau
function hookfunction<A1..., R1..., A2..., R2...>(function_to_hook: (A1...) -> R1..., hook: (A2...) -> R2...): (A1...) -> R1...
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau function_to_hook` | The function that will be hooked |
| `#!luau hook` | The function that will be used as a hook |

---

## Example

```luau title="Hooking functions with hookfunction" linenums="1"
local function DummyFunction()
    print("I am not hooked!")
end

local function DummyHook()
    print("I am hooked!")
end

DummyFunction() -- Output: I am not hooked!

local OldFunction = hookfunction(DummyFunction, DummyHook)

DummyFunction() -- Output: I am hooked!
OldFunction() -- Output: I am not hooked!
```
