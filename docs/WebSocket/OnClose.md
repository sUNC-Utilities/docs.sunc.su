# WebSocket.OnClose

Triggered when the WebSocket connection closes.

```luau
ws.OnClose:Connect(function(): ()
    -- cleanup logic
end)
```

---

## Example

```luau title="Detecting connection close"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnClose:Connect(function()
    print("Closed")
end)

ws:Close() -- Output: Closed
```
