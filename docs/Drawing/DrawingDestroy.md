# `Drawing:Destroy`

`#!luau Drawing:Destroy()` permanently deletes a drawing object and removes it from the screen. Once destroyed, the drawing will no longer be visible or updatable, and its `#!luau __OBJECT_EXISTS` field will return `#!luau false`.

This is the recommended way to clean up individual drawing objects when they are no longer needed.

```luau
function Drawing:Destroy(): ()
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This method takes no parameters. |

---

## Example

```luau title="Creating a circle and destroying the drawing object" linenums="1"
local Camera = game.Workspace.CurrentCamera
local Viewport = Camera.ViewportSize
local Position = Vector2.new(Viewport.X / 2, Viewport.Y / 2)

local circle = Drawing.new("Circle")
circle.Radius = 50
circle.Color = Color3.fromRGB(255, 0, 0)
circle.Filled = true
circle.NumSides = 150
circle.Position = Position
circle.Transparency = 1
circle.Visible = true

print(circle.__OBJECT_EXISTS) -- Output: true
circle:Destroy()
print(circle.__OBJECT_EXISTS) -- Output: false
```
