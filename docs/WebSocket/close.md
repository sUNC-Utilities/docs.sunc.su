# `WebSocket:Close`

`#!luau WebSocket:Close` terminates an active WebSocket connection.

Once closed, no further messages can be sent or received. This is useful when cleaning up resources or intentionally disconnecting from a server.

```luau
function WebSocket:Close(): ()
```

## Parameters

| Parameter | Description        |
|-----------|--------------------|
| *(none)*  | This function takes no parameters. |

---

## Example

```luau title="Closing a WebSocket connection" linenums="1"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnClose:Connect(function()
    print("Disconnected from server.")
end)

ws:Close() -- Output: Disconnected from server.
```
