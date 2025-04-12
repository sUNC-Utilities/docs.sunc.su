# `firetouchinterest`

!!! warning "Avoid implementing in Luau"

    This function should **not be implemented** in Luau. Doing so exposes you to easy detection vectors.

`#!luau firetouchinterest` simulates a physical touch event between two [`#!luau BasePart`](https://create.roblox.com/docs/reference/engine/classes/BasePart) objects. It can emulate both the start and end of a [`#!luau Touched`](https://create.roblox.com/docs/reference/engine/classes/BasePart#Touched) event.

```luau
function firetouchinterest(part1: BasePart, part2: BasePart, toggle: boolean | number): ()
```

## Parameters

| Parameter      | Description                                                                                  |
|----------------|----------------------------------------------------------------------------------------------|
| `#!luau part1`   | The initiating [`#!luau BasePart`](https://create.roblox.com/docs/reference/engine/classes/BasePart). |
| `#!luau part2`   | The [`#!luau BasePart`](https://create.roblox.com/docs/reference/engine/classes/BasePart) that should be touched.            |
| `#!luau toggle`  | Whether to simulate touch start or end. `#!luau false` or `#!luau 0` simulates touch; `#!luau true` or `#!luau 1` simulates un-touch. |

---

## Example

```luau title="Simulating a Touched event using firetouchinterest" linenums="1"
local dummy_part = Instance.new("Part")
dummy_part.CFrame = CFrame.new(0, -200, 0)
dummy_part.Anchored = true
dummy_part.Parent = workspace

dummy_part.Touched:Connect(function(part)
    print(part.Name .. " touched the dummy part!")
end)

local player_head = game.Players.LocalPlayer.Character.Head

firetouchinterest(player_head, dummy_part, false) -- Simulate touch
task.wait(0.5)
firetouchinterest(player_head, dummy_part, true) -- Simulate un-touch
```
