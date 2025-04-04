# `getrunningscripts`

`#!luau getrunningscripts` returns a list of **all actively running scripts** in the caller's global state. This includes [`Script`](https://create.roblox.com/docs/reference/engine/classes/Script), [`LocalScript`](https://create.roblox.com/docs/reference/engine/classes/LocalScript), and [`ModuleScript`](https://create.roblox.com/docs/reference/engine/classes/ModuleScript) instances - excluding [CoreScripts](https://robloxapi.github.io/ref/class/CoreScript.html) by default.

```luau
function getrunningscripts(): { Script | LocalScript | ModuleScript }
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Checking for active scripts in the session" linenums="1"
local running = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
local inactive = Instance.new("LocalScript") -- Not running because no bytecode to run

for _, script in pairs(getrunningscripts()) do
    if script == running then
        print("Found the running Animate script.")
    elseif script == inactive then
        print("This should never print.")
        print("If this did print, then you have just experienced 1 in a quintillion chance of BITS FLIPPING from radiation. Do you live inside a nuclear reactor?")
    end
end
```
