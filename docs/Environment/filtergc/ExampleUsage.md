# `filtergc` Usage Example

This example demonstrates how to use `#!luau filtergc` to locate a specific **function** in memory using the **upvalues** and **constants** it captures.

---

## Example function (decompiled and simplified for clarity)

```luau
local function createHandler()
    local speed = 10
    local name = "Enemy"
    local hits = {}

    local function handleHit(damage)
        print(name .. " was hit!")
        hits[#hits + 1] = damage * speed
    end

    return handleHit
end
```

We want to retrieve this `handleHit` function from memory.

---

## Step 1: Match the Upvalues and Constants

You can use `#!luau filtergc` to search for the function based on its **upvalues** and **constants:**

```luau
local match = filtergc("function", {
    Upvalues = { "speed", "name", "hits" },
    Constants = { " was hit!", 1 },
}, true)
```

> ✅ This will return the first matching function whose upvalues and constants follow the criteria.

---

## Step 2: Call the Function (Optional)

If the function doesn't require complex arguments, you can call it directly:

```luau
match(5) -- Outputs: "Enemy was hit!" and records the damage as 5 * speed
```
---

## Notes

- You must run `#!luau filtergc` **after** the function is loaded in memory (e.g., the module/script defining it has executed).
- This is just an example of how `#!luau filtergc` can be used. Do not attempt to run this in a live game without proper precautions, as many games have anti-cheat systems that may instantly detect and ban you for accessing internal memory without appropriate protection or safeguards.

---

## Related
- [FunctionFilterOptions](./FunctionFilterOptions.md)
- [TableFilterOptions](./TableFilterOptions.md)
