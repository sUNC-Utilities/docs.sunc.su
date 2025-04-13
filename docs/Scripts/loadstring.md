# `loadstring`

!!! warning "Unsafe by design"

    Compiles the given string, and returns it runnable in a function. The environment must become unsafe after this function is called due to it allowing the modification of globals uncontrollably (see [setfenv](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#setfenv)/[getfenv](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#getfenv) documentation).

```luau
function loadstring<A..., T...>(source: string, chunkname: string?): (((A...) -> T...) | nil, string?)
```

## Parameters

| Parameter         | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `#!luau source`        | The source code string to compile.                                           |
| `#!luau chunkname?` | *(Optional)* Custom chunk name |

---

## Examples

### Example 1

```luau title="Compiling and running source code" linenums="1"
loadstring([[
    placeholder = {"Example"}
]])()

print(placeholder[1]) -- Output: Example
```

---

### Example 2

```luau title="Using a custom chunk name" linenums="1"
local func, err = loadstring("Example = ", "CustomChunk")

print(func) -- Output: nil
print(err)  -- Output: [string "CustomChunk"]:1: Expected identifier when parsing expression, got <eof>
```
