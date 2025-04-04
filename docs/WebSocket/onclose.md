# `WebSocket.OnClose`

`#!luau WebSocket.OnClose` is an [event](https://create.roblox.com/docs/scripting/events) that fires when the WebSocket connection has been closed - either by the client or the server.

This event is useful for handling cleanup, reconnection logic, or user notifications when a session ends.

```luau
WebSocket.OnClose:Connect(callback: () -> ()): RBXScriptConnection
```

## Parameters

| Parameter | Description                        |
|-----------|------------------------------------|
| *(none)*  | This event does not pass arguments. |

---

## Example

```luau title="Responding to connection closure" linenums="1"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnClose:Connect(function()
    print("WebSocket closed.")
end)

ws:Close() -- Output: WebSocket closed.
```
