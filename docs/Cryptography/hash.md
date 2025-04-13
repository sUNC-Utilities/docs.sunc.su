# `crypt.hash`

!!! info "Notes on `#!luau crypt.hash`"

    Not every executor supports the same hashing algorithms, though the most commonly supported [families](https://crypto.stackexchange.com/questions/10297/whats-the-meaning-of-family-in-family-of-hash-functions) include:
   [MD5](https://en.wikipedia.org/wiki/MD5), [SHA-1](https://en.wikipedia.org/wiki/SHA-1), [SHA-2](https://en.wikipedia.org/wiki/SHA-2), [SHA-3](https://en.wikipedia.org/wiki/SHA-3)

    `#!luau crypt.hash` returns the result of hashing the data using the specified algorithm.


```luau
function crypt.hash(data: string, algorithm: string): string
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau data` | The string you want to hash |
| `#!luau algorithm` | The hashing algorithm |

---

## Example

```luau
local hash = crypt.hash("Hello from sUNC!", "md5")
print(hash) --> c5a0ded7ed83b38e66bdb100ea52632f
```
