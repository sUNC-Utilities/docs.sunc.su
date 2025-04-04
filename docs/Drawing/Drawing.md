# Drawing Object Types

The base `#!luau Drawing` class represents a renderable 2D object that appears on the user's screen. Every specific drawing type (e.g. `Circle`, `Text`, `Line`) inherits from this base and extends it with shape-specific properties.

Drawing objects are not Instances - they are client-only graphical primitives that do not interact with the 3D world and must be managed manually.

---

## Shared Properties

All drawing object types inherit the following fields:

| Property           | Type      | Description                                                                 |
|--------------------|-----------|-----------------------------------------------------------------------------|
| `#!luau Visible`     | `#!luau boolean` | Whether the object is rendered. Defaults to `#!luau false`.                        |
| `#!luau ZIndex`      | `#!luau number`  | Render order; higher values appear on top.                                  |
| `#!luau Transparency`| `#!luau number`  | Opacity (1 = fully opaque, 0 = invisible).                                  |
| `#!luau Color`       | `#!luau Color3`  | The color of the drawing.                                                   |
| `#!luau __OBJECT_EXISTS` | `#!luau boolean` | Whether the drawing object still exists after creation.                |

---

## Methods

| Method Signature                        | Description                           |
|----------------------------------------|---------------------------------------|
| [`#!luau Drawing:Destroy()`](./DrawingDestroy.md) | Permanently removes the drawing from view and invalidates its reference. |

---

## Shape-Specific Types

Each subtype of `Drawing` exposes unique fields that define their visual representation. Below are the supported types:

### 🧵 Line

| Property       | Type     | Description                      |
|----------------|----------|----------------------------------|
| `#!luau From`    | `#!luau Vector2`| Start position of the line.       |
| `#!luau To`      | `#!luau Vector2`| End position of the line.         |
| `#!luau Thickness`| `#!luau number` | Width of the line.                |

### 📝 Text

| Property         | Type           | Description                                   |
|------------------|----------------|-----------------------------------------------|
| `#!luau Text`      | `#!luau string`       | The text content to render.                   |
| `#!luau TextBounds`| `#!luau Vector2` 🔒   | Computed text size (read-only).               |
| `#!luau Font`      | `#!luau Drawing.Font` | Font to use (`UI`, `System`, `Plex`, etc.).   |
| `#!luau Size`      | `#!luau number`       | Size of the text.                             |
| `#!luau Position`  | `#!luau Vector2`      | Top-left corner of the text.                  |
| `#!luau Center`    | `#!luau boolean`      | Horizontally center the text.                |
| `#!luau Outline`   | `#!luau boolean`      | Whether to draw an outline.                  |
| `#!luau OutlineColor`| `#!luau Color3`     | Outline color.                               |

### 🖼️ Image

| Property     | Type     | Description                                         |
|--------------|----------|-----------------------------------------------------|
| `#!luau Data`   | `#!luau string`  | Raw image byte string (e.g. from [`#!luau readfile`](../Filesystem/readfile.md)).       |
| `#!luau Size`   | `#!luau Vector2`| Size of the rendered image.                         |
| `#!luau Position`| `#!luau Vector2`| Top-left corner of the image.                       |
| `#!luau Rounding`| `#!luau number` | Amount of corner rounding (optional aesthetic).     |

### 🟢 Circle

| Property       | Type      | Description                                           |
|----------------|-----------|-------------------------------------------------------|
| `#!luau NumSides` | `#!luau number`  | Number of sides used to approximate the circle.       |
| `#!luau Radius`   | `#!luau number`  | Radius of the circle.                                |
| `#!luau Position` | `#!luau Vector2` | Center point of the circle.                          |
| `#!luau Thickness`| `#!luau number`  | Outline thickness (if not filled).                   |
| `#!luau Filled`   | `#!luau boolean` | Whether the circle is filled.                        |

### 🔲 Square

| Property       | Type      | Description                                           |
|----------------|-----------|-------------------------------------------------------|
| `#!luau Size`     | `#!luau Vector2` | Size of the rectangle.                               |
| `#!luau Position` | `#!luau Vector2` | Top-left corner.                                     |
| `#!luau Thickness`| `#!luau number`  | Outline thickness (if not filled).                   |
| `#!luau Filled`   | `#!luau boolean` | Whether the square is filled.                        |

### 🟥 Quad

| Property       | Type      | Description                        |
|----------------|-----------|------------------------------------|
| `#!luau PointA`   | `#!luau Vector2` | First point.                        |
| `#!luau PointB`   | `#!luau Vector2` | Second point.                       |
| `#!luau PointC`   | `#!luau Vector2` | Third point.                        |
| `#!luau PointD`   | `#!luau Vector2` | Fourth point.                       |
| `#!luau Thickness`| `#!luau number`  | Outline thickness (if not filled).  |
| `#!luau Filled`   | `#!luau boolean` | Whether the quad is filled.         |

### 🔺 Triangle

| Property       | Type      | Description                        |
|----------------|-----------|------------------------------------|
| `#!luau PointA`   | `#!luau Vector2` | First point.                        |
| `#!luau PointB`   | `#!luau Vector2` | Second point.                       |
| `#!luau PointC`   | `#!luau Vector2` | Third point.                        |
| `#!luau Thickness`| `#!luau number`  | Outline thickness (if not filled).  |
| `#!luau Filled`   | `#!luau boolean` | Whether the triangle is filled.     |

## Examples

### Drawing an [Image](#image)

```luau title="Rendering a centered image" linenums="1"
local Camera = game.Workspace.CurrentCamera
local Viewport = Camera.ViewportSize
local Position = Vector2.new(Viewport.X / 2, Viewport.Y / 2)
local image = Drawing.new("Image")
image.Data = readfile("your_image.png")
image.Size = Vector2.new(455, 155)
image.Visible = true
image.Position = Position

task.wait(2)
image:Destroy()
```

### Using the [`#!luau __OBJECT_EXISTS` property](./DrawingDestroy.md)

```luau title="Checking if a Drawing still exists" linenums="1"
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
