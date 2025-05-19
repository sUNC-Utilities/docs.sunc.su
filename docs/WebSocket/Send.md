# WebSocket:Send

Sends a message over the WebSocket connection.

```luau
ws:Send(message: string): ()
```

## Parameters

| Parameter | Type    | Description            |
|-----------|---------|------------------------|
| `message` | string  | Message to send.       |

---

## Example

```luau title="Sending a message"
local ws = WebSocket.connect("ws://echo.websocket.events")
ws:Send("Hello WebSocket")
```
