# `loadstring`

!!! warning "Unsafe by design"

    The environment becomes **unsafe** after this function is called.  
    The resulting function has full global access and may overwrite existing globals unless sandboxed manually.  
    See [`setfenv`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#setfenv) and [`getfenv`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#getfenv) for more advanced environment control - ensure that "Show Deprecated" is enabled.

`#!luau loadstring` compiles a string of Lua code into a function that can be executed later. This function shares the caller's environment and behaves similarly to [`#!lua load()` in standard Lua](https://www.lua.org/manual/5.3/manual.html#pdf-load).

```luau
function loadstring<A...>(source: string, chunkname: string?): ((A...) -> any | nil, string?)
```

## Parameters

| Parameter         | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `#!luau source`        | The source code string to compile.                                           |
| `#!luau chunkname?` | *(Optional)* Custom name for debugging errors or tracebacks. |

---

## Examples

### Example 1

```luau title="Example 1: Compiling and running source code" linenums="1"
loadstring([[
    Placeholder = {"Example"}
]])()

print(Placeholder[1]) -- Output: Example
```

---

### Example 2

```luau title="Example 2: Error handling with a custom chunk name" linenums="1"
local func, err = loadstring("Example = ", "CustomChunk")

print(func) -- Output: nil
print(err)  -- Output: [string "CustomChunk"]:1: Expected identifier when parsing expression, got <eof>
```
