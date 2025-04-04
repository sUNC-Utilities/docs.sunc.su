# `islclosure`

`#!luau islclosure` checks whether a given function is a Luau (L) closure or not.

```luau
function islclosure(func: (...any) -> (...any)): boolean
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau func` | The function to check. |

---

## Example

```luau title="Verifying Lua (L) closures with islclosure" linenums="1"
local function DummyLuaFunction()
    print("This is an executor Lua closure")
end

local DummyCFunction = newcclosure(function()
    print("This is an executor C closure")
end)

local DummyStandardCFunction = print

print(islclosure(DummyLuaFunction)) -- Output: true
print(islclosure(DummyStandardCFunction)) -- Output: false
print(islclosure(DummyCFunction)) -- Output: false
```
