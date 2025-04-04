# `filtergc`

`#!luau filtergc` allows you to retrieve specific garbage-collected values (functions or tables) from Luau's memory, using fine-tuned filters.

This function is most often used to find game-defined functions or internal tables by matching bytecode constants, keys, metatables, and more. It behaves similarly to [`#!luau getgc`](../getgc.md), but offers ***A LOT*** more control over what gets returned.

```luau
function filtergc(
    filter_type: "function" | "table",
    filter_options: FunctionFilterOptions | TableFilterOptions,
    return_one: boolean
):
    (...any) -> (...any) | { [any]: any } | { (...any) -> (...any) | { [any]: any } }
```

---

## Parameters

| Parameter         | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `#!luau filter_type`   | The type of value to search for: either [`#!luau "function"`](./FunctionFilterOptions.md) or [`#!luau "table"`](./TableFilterOptions.md).         |
| `#!luau filter_options` | A set of rules used to match functions or tables. [See below.](#filter-option-types)               |
| `#!luau return_one?`   | If `#!luau true`, returns the first match instead of a table of matches.         |

---

## Filter Option Types

Each filter type has its own valid fields:

- See [Function Filters](./FunctionFilterOptions.md) for matching functions by name, constants, and more.
- See [Table Filters](./TableFilterOptions.md) for matching tables by keys, values, metatables, and more.

---

## Notes

- Garbage-collected values must still be referenced by a live script to be found.
- Some filters (like `Constants` or `Hash`) do not apply to C functions.
- Overuse may lead to performance degradation on large memory heaps.

See [Function Filters](./FunctionFilterOptions.md) and [Table Filters](./TableFilterOptions.md) for full filtering options.

---

## Examples

### Matching by `#!luau Hash`

```luau title="Matching a function by bytecode hash" linenums="1"
local function DummyFunction()
    return "Hello"
end

local DummyFunctionHash = getfunctionhash(DummyFunction)

local Retrieved = filtergc("function", {
    Hash = DummyFunctionHash, -- C closures will always fail this check
    IgnoreExecutor = false
}, true)

print(getfunctionhash(Retrieved) == DummyFunctionHash) -- Output: true
print(Retrieved == DummyFunction) -- Output: true
```

### Matching by `#!luau Constants` and `#!luau Upvalues`

```luau title="Matching by function constants and upvalues" linenums="1"
local Upvalue = 5

local function DummyFunction()
    Upvalue += 1
    print(game.Players.LocalPlayer)
end

local Retrieved = filtergc("function", {
    Constants = { "print", "game", "Players", "LocalPlayer", 1 },
    Upvalues = { 5 },
    IgnoreExecutor = false
}, true)

print(Retrieved == DummyFunction) -- Output: true
```
