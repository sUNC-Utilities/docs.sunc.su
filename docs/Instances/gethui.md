# `gethui`

!!! info "Should return a UI container with minimised detection"

    `#!luau gethui` returns a **hidden [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance)** container used for safely storing UI elements. This container is designed to **avoid detection** by most property-based scans and iteration methods.

    Descendants of this container will **not appear** in loops over [`#!luau CoreGui`](https://create.roblox.com/docs/reference/engine/classes/CoreGui), and the container itself may not be discoverable unless accessed directly or through special registry-based means.

`#!luau gethui` returns a cloaked [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance), typically a [`#!luau ScreenGui`](https://create.roblox.com/docs/reference/engine/classes/ScreenGui), that acts as a safe space for rendering GUI objects. It avoids common detection techniques used in anti-cheat systems.

This function is especially useful for **injected GUIs** that should remain hidden from other scripts and scans.

```luau
function gethui(): Instance
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Creating undetectable UI in gethui" linenums="1"
local gui = Instance.new("ScreenGui")
gui.Name = "SafeGui"
gui.Parent = gethui()

local label = Instance.new("TextLabel")
label.Size = UDim2.fromOffset(200, 50)
label.Text = "Hello from gethui!"
label.Parent = gui
```
