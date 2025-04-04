# `getscriptbytecode`

!!! info "Nil output for empty bytecode"

    This function should return `#!luau nil` if the script has no bytecode. This makes it easier to check for absence consistently across executors.

`#!luau getscriptbytecode` retrieves the **compiled bytecode** of a [`#!luau LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript) or [`#!luau ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript).

This function is useful for validating or analysing the compiled contents of a script, especially when reverse-engineering.

```luau
function getscriptbytecode(script: LocalScript | ModuleScript): string | nil
```

## Parameters

| Parameter      | Description                                              |
|----------------|----------------------------------------------------------|
| `#!luau script` | The script instance to retrieve the bytecode from.       |

---

## Example

```luau title="Reading the bytecode of a running script" linenums="1"
local Animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")

print(getscriptbytecode(Animate)) -- Returns bytecode as a string

print(getscriptbytecode(Instance.new("LocalScript"))) -- Output: nil
```
