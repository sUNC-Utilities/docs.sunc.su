# `getrenv`

!!! warning "Adding `_G` and `shared`"
    Make sure to properly implement _G and shared into the Roblox environemnt, as poor implementations will lead to detection vectors!

`#!luau getrenv` returns the **Roblox global environment**, which is used by game scripts. This environment is separate from the executor's environment returned by [`#!luau getgenv`](./getgenv.md).


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
