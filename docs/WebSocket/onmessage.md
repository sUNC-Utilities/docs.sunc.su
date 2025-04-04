# `WebSocket.OnMessage`

`#!luau WebSocket.OnMessage` is an [event](https://create.roblox.com/docs/scripting/events) that fires whenever a message is received from the connected WebSocket server.

You can connect a listener to this event to handle incoming messages in real time.

```luau
WebSocket.OnMessage:Connect(callback: (message: string) -> ()): RBXScriptConnection
```

## Parameters

| Parameter         | Description                                 |
|-------------------|---------------------------------------------|
| `#!luau message`  | The text content of the received message.   |

---

## Example

```luau title="Responding to incoming messages" linenums="1"
local ws = WebSocket.connect("ws://echo.websocket.events")

ws.OnMessage:Connect(function(message)
    print("Received:", message)
end)

ws:Send("Hello, WebSocket!") -- Output: Received: Hello, WebSocket!
```
