# Function Filter Options

Function filters let you refine what types of Luau functions should be returned when using [`#!luau filtergc`](./README.md) with `#!luau "function"` as the filter type.

Each key in the filter table specifies a criterion that must be matched by the function for it to be returned. If multiple keys are present, **all of them must match**.

---

## Available Options

| Key                 | Type             | Description                                                                                          | Default |
|----------------------|------------------|------------------------------------------------------------------------------------------------------|---------|
| `#!luau Name`          | `#!luau string?`    | If provided, only functions with this exact name are returned.                                       | `#!luau nil`   |
| `#!luau IgnoreExecutor`| `#!luau boolean?`  | If `true`, filters out functions that were created inside the executor.                              | `#!luau true`  |
| `#!luau Hash`          | `#!luau string?`    | Filters by the bytecode hash of the function. See [`#!luau getfunctionhash`](../../Closures/getfunctionhash.md). | `#!luau nil`   |
| `#!luau Constants`     | `#!luau { any }?`   | Only includes functions that contain **all** of the constants listed here.                           | `#!luau nil`   |
| `#!luau Upvalues`      | `#!luau { any }?`   | Only includes functions that contain **all** of the given upvalues.                                  | `#!luau nil`   |

---

## Notes

- If `#!luau IgnoreExecutor` is not explicitly set to `#!luau false`, executor-created functions are skipped by default.
- Filters like `#!luau Constants`, `#!luau Upvalues`, and `#!luau Hash` do not apply to C closures.
- Name matching is strict and case-sensitive.

---

Here's the updated **Examples** section for `FunctionFilterOptions.md`, formatted to your standards with titles and `linenums`:

---

## Examples

!!! info "False negatives may occur"

    Executing these examples multiple times in a short period of time may result in false negatives.

### Using `#!luau Name` (returns a `#!luau table` by default)

```luau title="Matching a function by name" linenums="1"
local function DummyFunction() 
end

local Retrieved = filtergc("function", {
    Name = "DummyFunction", 
    IgnoreExecutor = false
})

print(typeof(Retrieved)) -- Output: table
print(Retrieved[1] == DummyFunction) -- Output: true
```

---

### Using `#!luau Name` with `#!luau return_one = true`

```luau title="Single match using return_one" linenums="1"
local function DummyFunction() 
end

local Retrieved = filtergc("function", {
    Name = "DummyFunction", 
    IgnoreExecutor = false
}, true)

print(typeof(Retrieved)) -- Output: function
print(Retrieved == DummyFunction) -- Output: true
```
