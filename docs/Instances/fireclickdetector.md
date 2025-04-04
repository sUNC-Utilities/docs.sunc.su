# `fireclickdetector`

!!! warning "Avoid implementing in Luau"

    This function should **not be implemented** in Luau. Doing so exposes you to detection vectors and inconsistent behavior.

`#!luau fireclickdetector` triggers a [`#!luau ClickDetector`](https://create.roblox.com/docs/reference/engine/classes/ClickDetector) event manually. By default, it fires the [`#!luau MouseClick`](https://create.roblox.com/docs/reference/engine/classes/ClickDetector#MouseClick) event, but other variants are also supported.

```luau
function fireclickdetector(detector: ClickDetector, distance: number?, event: string?): ()
```

## Parameters

| Parameter        | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `#!luau detector`  | The [`#!luau ClickDetector`](https://create.roblox.com/docs/reference/engine/classes/ClickDetector) to trigger.       |
| `#!luau distance?` | (Optional) Distance from which the click is simulated. Defaults to infinite. |
| `#!luau event?`    | (Optional) The event to trigger. Options: `#!luau "MouseClick"`, `#!luau "RightMouseClick"`, `#!luau "MouseHoverEnter"`, `#!luau "MouseHoverLeave"`. Defaults to `#!luau "MouseClick"`. |

---

## Example

```luau title="Firing different ClickDetector events" linenums="1"
local detector = Instance.new("ClickDetector")

detector.MouseClick:Connect(function(player)
    print(player.Name .. " triggered MouseClick")
end)

detector.RightMouseClick:Connect(function(player)
    print(player.Name .. " triggered RightMouseClick")
end)

fireclickdetector(detector, 0, "MouseClick")        -- Output: [YourName] triggered MouseClick
fireclickdetector(detector, 0, "RightMouseClick")   -- Output: [YourName] triggered RightMouseClick
```
