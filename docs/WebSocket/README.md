# WebSocket

The `#!luau WebSocket` class provides a lightweight interface for establishing and working with WebSocket connections. It allows scripts to **send** and **receive** messages over a persistent connection to a [WebSocket](https://en.wikipedia.org/wiki/WebSocket) server.

> Note: This is **client-only**, meaning you cannot create a WebSocket server.

---

## What can you do?

With the WebSocket class, you can:

- Connect to WebSocket servers using [`WebSocket.connect`](./connect.md)
- Listen for messages with [`WebSocket.OnMessage`](./OnMessage.md)
- Detect when a connection is closed with [`WebSocket.OnClose`](./OnClose.md)
- Send messages over the connection with [`WebSocket:Send`](./Send.md)
- Close the connection manually using [`WebSocket:Close`](./Close.md)
