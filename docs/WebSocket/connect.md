# WebSocket.connect

Attempts to create a new connection to the provided URL. The URL must be a valid WebSocket server URL, typically starting with `ws://` or `wss://`.

```luau
function WebSocket.connect(url: string): WebSocket
```

## Parameters

| Parameter | Type    | Description                       |
|-----------|---------|-----------------------------------|
| `url`     | string  | A WebSocket URL.                  |

```

## Example

```luau title="Creating a WebSocket connection"
local ws = WebSocket.connect("ws://echo.websocket.events")
```
