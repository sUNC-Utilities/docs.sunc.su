# `crypt.generatekey`

`#!luau crypt.generatekey` Generates a [Base64](https://en.wikipedia.org/wiki/Base64) encoded 256-bit key. The result can be used as the second parameter for the `#!luau crypt.encrypt` and `#!luau crypt.decrypt` functions.

```luau
function crypt.generatekey(): string
```

---

## Example

```luau
local bytes = crypt.generatekey()
print(#crypt.base64decode(bytes)) --> 32 (256 bits)
```
