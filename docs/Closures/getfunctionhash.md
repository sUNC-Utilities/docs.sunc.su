# `getfunctionhash`

!!! info "Do not confuse with [`#!luau getscripthash`](../Scripts/getscripthash.md)"

`#!luau getfunctionhash` returns the ***hex-represented*** [SHA-384 hash](https://en.wikipedia.org/wiki/SHA-3) of a provided function's **re-built bytecode**.

```luau
function getfunctionhash(function_to_hash): string
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau function_to_hash` | The function to retrieve the hash of. |

---

## Example

```luau title="Checking the SHA-384 hash of functions with getfunctionhash" linenums="1"
local function isSHA384Hex(hash)
    if #hash ~= 96 then
        return false
    end
    if not hash:match("^[0-9a-fA-F]+$") then
        return false
    end
    return true
end

local DummyFunction0 = function() end
local DummyFunction1 = function(...) end
local DummyFunction2 = function() end

print(isSHA384Hex(getfunctionhash(DummyFunction0))) -- Output: true
print(getfunctionhash(DummyFunction0) == getfunctionhash(DummyFunction1)) -- Output: false
print(getfunctionhash(DummyFunction0) == getfunctionhash(DummyFunction2)) -- Output: true
```
