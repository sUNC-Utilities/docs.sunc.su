# `crypt.generatebytes`

`#!luau crypt.generatebytes` Generates a random sequence of bytes of the given size. Returns the sequence as a [Base64](https://en.wikipedia.org/wiki/Base64) encoded string.

```luau
function crypt.generatebytes(size: number): string
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau size` | The number of bytes to generate. |

---

## Example

```luau
local bytes = crypt.generatebytes(16)
print(bytes) --> bXlzcWwgYm9vbGVhbnM=
print(#crypt.base64decode(bytes)) --> 16
```
