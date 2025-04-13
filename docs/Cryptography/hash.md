# `crypt.hash`

!!! info "Notes on `#!luau crypt.hash`"

    Not every executor supports the same hashing algorithms, though the most commonly supported ones include:
    [SHA-1](https://en.wikipedia.org/wiki/SHA-1), [SHA-256](https://en.wikipedia.org/wiki/SHA-2), [SHA-384](https://en.wikipedia.org/wiki/SHA-2), 
    [SHA-512](https://en.wikipedia.org/wiki/SHA-2), [MD5](https://en.wikipedia.org/wiki/MD5), and other `SHA-3` variants like `SHA3-224`, `SHA3-256`, `SHA3-512` (you can learn more about them [here](https://en.wikipedia.org/wiki/SHA-3#Examples_of_SHA-3_variants))

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
