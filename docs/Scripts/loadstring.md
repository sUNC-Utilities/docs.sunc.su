# `loadstring`

!!! warning "Unsafe by design"

    Compiles the given string, and returns it runnable in a function. The environment must become unsafe after this function is called due to it allowing the modification of globals uncontrollably (see [`#!luau setfenv`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#setfenv)/[`#!luau getfenv`](https://create.roblox.com/docs/reference/engine/globals/LuaGlobals#getfenv) documentation).

!!! info "Does not error"

    Previous ambiguous wording for this function made it seem like calling `#!luau loadstring` itself with invalid code would actually error, but in fact it does not. Instead, as stated below, it returns `#!luau nil` and a `#!luau string` (which happens to be an error message).

`#!luau loadstring` compiles a string of Luau code and returns it as a runnable function. If the code has errors, two things are returned: `#!luau nil` and a `#!luau string`, which is the error message.

```luau
function loadstring<A...>(source: string, chunkname: string?): (((A...) -> any) | nil, string?)
```

## Parameters

| Parameter           | Description                        |
| ------------------- | ---------------------------------- |
| `#!luau source`     | The source code string to compile. |
| `#!luau chunkname?` | Custom chunk name.                 |

---

## Examples

### Example 1

```luau title="Compiling and running source code successfully" linenums="1"
loadstring([[
    placeholder = {"Example"}
]])()

print(placeholder[1]) -- Output: Example
```

---

### Example 2

```luau title="Using a custom chunk name while also getting an error" linenums="1"
local func, err = loadstring("Example = ", "CustomChunk")

print(func) -- Output: nil
print(err)  -- Output: [string "CustomChunk"]:1: Expected identifier when parsing expression, got <eof>
```
