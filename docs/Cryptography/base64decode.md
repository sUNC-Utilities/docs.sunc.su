# `crypt.base64decode`

`#!luau crypt.base64decode` decodes a [Base64-encoded](https://en.wikipedia.org/wiki/Base64) string back into its original form.

```luau
function crypt.base64decode(data: string): string
```

## Parameters

| Parameter | Description |
|-----------|-------------|
| `#!luau data` | The Base64-encoded string to decode. |

---

## Example

```luau
local bytecode = game:HttpGet("https://api.rubis.app/v2/scrap/zuxQZuM9Tnl5MRbo/raw")
writefile("sound.mp3", crypt.base64decode(bytecode)) -- This file should be a valid and working mp3 file.
```
