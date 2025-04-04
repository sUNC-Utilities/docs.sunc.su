# `WebSocket.connect`

`#!luau WebSocket.connect` creates a connection to a WebSocket server and returns a new `WebSocket` object.

This object can then be used to send messages, receive events, and manage the connection lifecycle.

```luau
function WebSocket.connect(url: string): WebSocket
```

## Parameters

| Parameter     | Description                                      |
|---------------|--------------------------------------------------|
| `#!luau url`  | The full WebSocket URL, e.g. `ws://host:port`.   |

---

## Example

```luau title="Creating a WebSocket object" linenums="1"
local ws = WebSocket.connect("ws://echo.websocket.events")
print(ws) -- Output: WebSocket
```

Once you've created a `WebSocket` object, you can begin using its methods and events:

- [`#!luau WebSocket:Send`](./send.md) - Send a message
- [`#!luau WebSocket:Close`](./close.md) - Close the connection
- [`#!luau WebSocket.OnMessage`](./onmessage.md) - Listen for incoming messages
- [`#!luau WebSocket.OnClose`](./onclose.md) - Respond to connection closure
