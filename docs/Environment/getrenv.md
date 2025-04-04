# `getrenv`

!!! info "Do not confuse with [`#!luau getgenv`](./getgenv.md) or [`#!luau getsenv`](../Scripts/getsenv.md)."

!!! warning "This affects all client scripts"

    Modifying the Roblox environment can cause unexpected behavior or break game functionality. All local scripts and internal code run inside this environment - changes apply globally to the live game state.

!!! info "Executor environment is separate"

    The environment returned by `#!luau getrenv` is distinct from the executor's environment ([`#!luau getgenv`](./getgenv.md)). Changes here will not affect the executor's internal functions or sandbox.

`#!luau getrenv` returns the **live Roblox environment**, which is used internally by game scripts. This environment is separate from the executor's environment returned by [`#!luau getgenv`](./getgenv.md).

Modifications to this environment affect how the **game itself** behaves, but do not influence executor logic.

```luau
function getrenv(): { any }
```

## Parameters

| Parameter | Description                      |
|-----------|----------------------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Overriding Roblox environment functions" linenums="1"
getrenv().warn = "Hello!"
print(type(warn)) -- Output: string

getrenv().game = nil
print(game) -- Output: nil (for scripts using the Roblox environment)
```
