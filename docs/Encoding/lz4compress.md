# `lz4compress`

`#!luau lz4compress` compresses a string with the [LZ4](https://en.wikipedia.org/wiki/LZ4_(compression_algorithm)) compression algorithm.

```luau
function lz4compress(data: string): string
```

## Parameters

| Parameter     | Description             |
| ------------- | ----------------------- |
| `#!luau data` | The string to compress. |

---

## Example

```luau title="Compressing a string with the LZ4 compression algorithm" linenums="1"
local text = "Hello, world! Hello, world! Goodbye, world!"
print(#text) -- 43
print(#lz4compress(text)) -- 34
```

!!! info "4-byte size header must be excluded"

    Note that if you run this example and your version of `lz4compress` returns 38, then you must ensure that your output does not include the 4-byte size header.
