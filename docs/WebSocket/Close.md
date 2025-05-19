# WebSocket:Close

Closes the WebSocket connection.

```luau
ws:Close(): ()
```

---

## Example

```luau title="Closing a connection"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnClose:Connect(function()
    print("Closed!")
end)

ws:Close() -- Output: Closed!
```
