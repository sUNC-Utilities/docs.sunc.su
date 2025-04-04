# Drawing

The **Drawing** library provides a runtime API for rendering 2D visuals such as shapes, images, and text directly onto the game window.

These objects are **not Instances**, and instead exist as external render objects that can be created and destroyed independently from the game world.

---

## 🚦 What can you do?

With the Drawing library, you can:

- **Create** renderable shapes and text with [`#!luau Drawing.new`](./new.md)
- **Clear** all drawings using [`#!luau cleardrawcache`](./cleardrawcache.md)
- **Read and write** properties dynamically with [`#!luau getrenderproperty`](./getrenderproperty.md) and [`#!luau setrenderproperty`](./setrenderproperty.md)
- **Check** if an object is a render object using [`#!luau isrenderobj`](./isrenderobj.md)
- **Destroy** individual drawings cleanly using [`#!luau Drawing:Destroy`](./DrawingDestroy.md)

For full details on the shapes and objects you can draw, see [Drawing Object Types](./Drawing.md).

---

## 🚫 What can't you do?

Drawing objects are purely visual overlays:

- They cannot interact with the 3D world (e.g., collisions, physics).
- They are **screen-space only** - you must manage positions manually using [`#!luau Workspace.CurrentCamera`](https://create.roblox.com/docs/reference/engine/classes/Workspace#CurrentCamera) and its [`#!luau ViewportSize`](https://create.roblox.com/docs/reference/engine/classes/Camera#ViewportSize).
- They are **not replicated** and only affect the local client.

---

## 🎨 Object Types

Each shape is a subtype of the base [`#!luau Drawing`](./Drawing.md) object. All shapes also sare core fields like `Visible`, `Transparency`, and `Color`.

The available subtypes are:

- `Line`
- `Text`
- `Image`
- `Circle`
- `Square`
- `Quad`
- `Triangle`

You can explore the full list and their properties in [Drawing Object Types](./Drawing.md).

---

## 🧹 Cleanup

You are responsible for cleaning up drawing objects:

- Use [`#!luau Drawing:Destroy`](./DrawingDestroy.md) to delete a specific drawing object
- Use [`#!luau ceardrawcache`](./cleardrawcache.md) to remove all objects at once

Once destroyed, a drawing's `#!luau __OBJECT_EXISTS` field becomes `#!luau false`, and it will no longer render.
