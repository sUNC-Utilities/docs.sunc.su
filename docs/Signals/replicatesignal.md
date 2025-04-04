# `replicatesignal`

!!! tip "Signal arguments must match"

    Some signals require specific argument structures. If incorrect arguments are passed, the replication will silently fail. For reference, you can find signal definitions at [robloxapi.github.io/ref](https://robloxapi.github.io/ref/) or [sUNC's verified list](https://rubis.numelon.com/view/?scrap=AIOzG1Di7NSLADKE).

`#!luau replicatesignal` attempts to replicate a client-sided [`RBXScriptSignal`](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptSignal) to the server, emulating a real trigger event. This can be used to invoke server-bound behavior such as interactions with [`ClickDetector`](https://create.roblox.com/docs/reference/engine/classes/ClickDetector), [`ProximityPrompt`](https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt), and others.

```luau
function replicatesignal(signal: RBXScriptSignal, ...: any?)
```

## Parameters

| Parameter         | Description                                            |
|------------------|--------------------------------------------------------|
| `#!luau signal`    | The signal to replicate to the server.                |
| `#!luau ...`       | Arguments to pass to the signal, matching its signature. |

---

## Examples

??? info "These examples use our [testing game](../About/test-results.md#using-the-dedicated-game)"

    The examples provided below use our [testing game](../About/test-results.md#using-the-dedicated-game).

### Example 1

```luau title="Replicating a ClickDetector interaction" linenums="1"
local detector = workspace.replicatesigmal.ClickDetector
replicatesignal(detector.MouseActionReplicated, game.Players.LocalPlayer, 0)
task.wait(0.1)

print(game.Players.LocalPlayer:GetAttribute("MouseClickReplicated")) -- Output: true
```

### Example 2

```luau title="Incorrect argument usage" linenums="1"
local uiFrame = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame

-- These will fail silently
replicatesignal(uiFrame.MouseWheelForward)
replicatesignal(uiFrame.MouseWheelForward, 121)

-- This succeeds:
replicatesignal(uiFrame.MouseWheelForward, 121, 214)
task.wait(0.1)

print(game.Players.LocalPlayer:GetAttribute("MouseWheelForwardReplicated")) -- Output: true
```
