# WebSocket.OnMessage

Triggered when a message is received over the WebSocket connection.

```luau
ws.OnMessage:Connect(function(message: string): ()
    -- your logic here
end)
```

---

## Example

```luau title="Handling incoming messages"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnMessage:Connect(function(message)
    print("Received:", message)
end)

ws:Send("Hello") -- Output: Received: Hello
```
