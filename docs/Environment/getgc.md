# `getgc`

`#!luau getgc` returns a list of all **non-dead garbage-collectable values** currently in memory. These include functions, userdata, and optionally tables.

This function is useful for inspecting active memory, reverse-engineering closures, or locating specific tables created at runtime.

```luau
function getgc(include_tables: boolean?): { { any } | (...any) -> (...any) | userdata }
```

## Parameters

| Parameter           | Description                                               |
|---------------------|-----------------------------------------------------------|
| `#!luau include_tables?` | If `#!luau true`, also includes tables in the returned list. Defaults to `false`. |

---

## Example 1

```luau title="Function-only GC scan" linenums="1"
local DummyTable = {}
local function DummyFunction() end
task.wait(0.05) -- Step a bit

for _, value in pairs(getgc()) do
    if value == DummyFunction then
        print(`Found function: {DummyFunction}`)
    elseif value == DummyTable then
        print(`Found table?: {DummyTable}`) -- This shouldn't print
    end
end
```

---

## Example 2

```luau title="Full GC scan including tables" linenums="1"
local DummyTable = {}
local function DummyFunction() end
task.wait(0.05) -- Step a bit

for _, value in pairs(getgc(true)) do
    if value == DummyFunction then
        print(`Found function: {DummyFunction}`) -- Should print
    elseif value == DummyTable then
        print(`Found table: {DummyTable}`) -- Should also print
    end
end
```
