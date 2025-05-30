# `getgc`

`#!luau getgc` returns a list of **non-dead garbage-collectable values**. These include functions, userdatas, and optionally tables.

```luau
export type AnyFunction = (...any) -> (...any)
export type AnyTable = { [any]: any }
-- since userdata is not an actual luau type, we will be defining it for clarity sake; as getgc should also return them.
export type userdata = typeof(newproxy())

declare getgc:
    ((includeTables: true) -> { { AnyTable } | AnyFunction | userdata }) &
    ((includeTables: false?) -> { AnyFunction })
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
