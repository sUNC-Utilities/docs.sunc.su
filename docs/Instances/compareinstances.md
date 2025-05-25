# `compareinstances`

`#!luau compareinstances` checks if two [`#!luau Instances`](https://create.roblox.com/docs/reference/engine/classes/Instance) are equal.

This is primarily used for instances which have been [`#!luau cloneref`](./cloneref.md)'d, where the normal equality check with `#!luau ==` fails.

!!! info "Why Normal Equality Fails"

    Using `==` on a `#!luau cloneref`'d instance and a regular instance will return `false`, even though they refer to the same object internally. `compareinstances` bypasses this by resolving the internal reference behind the scenes.

```luau
function compareinstances(object1: Instance, object2: Instance): boolean
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| `#!luau object1`  | This first [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) to compare. |
| `#!luau object2` | The second [`#!luau Instance`](https://create.roblox.com/docs/reference/engine/classes/Instance) to compare against. |

---

## Example

```luau title="Comparing instances" linenums="1"
print(compareinstances(game, game))              -- true
print(compareinstances(game, workspace))         -- false
print(compareinstances(game, cloneref(game)))    -- true
print(game == cloneref(game))                    -- false
```
