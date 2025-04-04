# `Drawing.new`

`#!luau Drawing.new` creates a new render object (visual element) of the specified type. These objects render directly onto the game window and do not exist in the [`DataModel`](https://create.roblox.com/docs/reference/engine/classes/DataModel), meaning they are purely client-side.

The returned object inherits from the base [`#!luau Drawing`](./Drawing.md) class, and will have specific properties based on its type.

```luau
function Drawing.new(type: string): Drawing
```

## Parameters

| Parameter     | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| `#!luau type` | The type of drawing to create. Must be one of: [`Line`, `Text`, `Image`, `Circle`, `Square`, `Quad`, or `Triangle`](./Drawing.md). |

---

## Example

```luau title="Drawing a red filled circle in the center of the screen" linenums="1"
local camera = Workspace.CurrentCamera
local viewport = camera.ViewportSize
local position = Vector2.new(viewport.X / 2, viewport.Y / 2)

local circle = Drawing.new("Circle")
circle.Radius = 50
circle.Color = Color3.fromRGB(255, 0, 0)
circle.Filled = true
circle.NumSides = 32
circle.Position = position
circle.Transparency = 0.75
circle.Visible = true

-- Remove the circle after a short delay
task.wait(0.6)
circle:Destroy()
```
