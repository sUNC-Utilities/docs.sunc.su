# `WebSocket:Send`

`#!luau WebSocket:Send` transmits a text message to the connected WebSocket server.

It can be called at any point after a connection is successfully established using [`#!luau WebSocket.connect`](./connect.md).

```luau
function WebSocket:Send(message: string): ()
```

## Parameters

| Parameter         | Description                         |
|-------------------|-------------------------------------|
| `#!luau message`  | The text message to send.           |

---

## Example

```luau title="Send a message to the server" linenums="1"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnMessage:Connect(function(msg)
    print("Received:", msg)
end)

ws:Send("Hello from sUNC!") -- Output: Received: Hello from sUNC!
```
