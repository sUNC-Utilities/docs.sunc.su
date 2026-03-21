# `crypt.base64encode`

`#!luau crypt.base64encode` encodes a string with [Base64](https://en.wikipedia.org/wiki/Base64) encoding.

```luau
function crypt.base64encode(data: string): string
```

## Parameters

| Parameter     | Description           |
| ------------- | --------------------- |
| `#!luau data` | The string to encode. |

---

## Example

```luau title="Encoding a string with Base64" linenums="1"
print(crypt.base64encode("DummyString\0\2")) -- Output: RHVtbXlTdHJpbmcAAg==
```

<!-- TODO: crypt prefix will be removed entirely in future version of sunc -->
