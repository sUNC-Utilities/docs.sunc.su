# `getsenv`

!!! warning "Only works on active scripts"

    This function will throw an error if the script is not actively running or if it's running on a different Luau VM - such as an [Actor](https://create.roblox.com/docs/reference/engine/classes/Actor).

`#!luau getsenv` returns the **global environment table** of a given [`#!luau Script`](https://create.roblox.com/docs/reference/engine/classes/Script), [`#!luau LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript), or [`#!luau ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript).

This environment contains **all global variables, functions** available to the target script, such as custom-defined functions or state values.

```luau
function getsenv(script: Script | LocalScript | ModuleScript): { [any]: any }
```

## Parameters

| Parameter      | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `#!luau script` | The script instance whose environment should be retrieved.                 |

---

## Example

```luau title="Accessing a script's internal environment" linenums="1"
local animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")

local env = getsenv(animate)

print(typeof(env.onSwimming)) -- Output: function
```
