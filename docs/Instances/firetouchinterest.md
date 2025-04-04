# `firetouchinterest`

!!! warning "Avoid implementing in Luau"

    This function should **not be implemented** in Luau. It exposes detection risks and requires engine-level behavior that can't be safely replicated.

    The function should also **yield briefly** between toggle states to ensure proper registration. It must support both `#!luau number` and `#!luau boolean` types for toggling.

`#!luau firetouchinterest` simulates a physical touch event between two [`#!luau BasePart`](https://create.roblox.com/docs/reference/engine/classes/BasePart) objects. It can emulate both the start and end of a [`#!luau Touched`](https://create.roblox.com/docs/reference/engine/classes/BasePart#Touched) event.

```luau
function firetouchinterest(part1: BasePart, part2: BasePart, toggle: boolean | number): ()
```

## Parameters

| Parameter      | Description                                                                                  |
|----------------|----------------------------------------------------------------------------------------------|
| `#!luau part1`   | The initiating [`#!luau BasePart`](https://create.roblox.com/docs/reference/engine/classes/BasePart) (e.g. a character part). |
| `#!luau part2`   | The [`#!luau BasePart`](https://create.roblox.com/docs/reference/engine/classes/BasePart) that should be touched.            |
| `#!luau toggle`  | Whether to simulate touch start or end. `#!luau false` or `#!luau 0` simulates touch; `#!luau true` or `#!luau 1` simulates un-touch. |

---

## Example

```luau title="Simulating a Touched event using firetouchinterest" linenums="1"
local dummyPart = Instance.new("Part")
dummyPart.CFrame = CFrame.new(0, -200, 0)
dummyPart.Anchored = true
dummyPart.Parent = workspace

dummyPart.Touched:Connect(function(part)
    print(part.Name .. " touched the dummy part!")
end)

local playerHead = game.Players.LocalPlayer.Character.Head

firetouchinterest(playerHead, dummyPart, false) -- Simulate touch
task.wait(0.5)
firetouchinterest(playerHead, dummyPart, true) -- Simulate un-touch
```
