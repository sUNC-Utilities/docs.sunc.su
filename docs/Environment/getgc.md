# `getgc`

`#!luau getgc` returns a list of **non-dead garbage-collectable values**. These include functions, userdata, and optionally tables.

```luau
function getgc(includeTables: boolean?): { { any } | (...any) -> (...any) | userdata }
```

## Parameters

| Parameter           | Description                                               |
|---------------------|-----------------------------------------------------------|
| `#!luau includeTables?` | If `#!luau true`, also includes tables in the returned list. Defaults to `#!luau false`. |

---

## Example 1

```luau title="Function-only GC scan" linenums="1"
local dummy_table = {}
local function dummy_function() end
task.wait(0.05) -- Step a bit

for _, value in pairs(getgc()) do
    if value == dummy_function then
        print(`Found function: {dummy_function}`)
    elseif value == dummy_table then
        print(`Found table?: {dummy_table}`) -- This shouldn't print
    end
end
```

---

## Example 2

```luau title="Full GC scan including tables" linenums="1"
local dummy_table = {}
local function dummy_function() end
task.wait(0.05) -- Step a bit

for _, value in pairs(getgc(true)) do
    if value == dummy_function then
        print(`Found function: {dummy_function}`) -- Should print
    elseif value == dummy_table then
        print(`Found table: {dummy_table}`) -- Should also print
    end
end
```
