# WebSocket

The **WebSocket** library provides a lightweight interface for establishing and working with WebSocket connections in real time.

It allows scripts to **send** and **receive** messages over a persistent connection to a WebSocket server, enabling live updates and true two-way communication - unlike traditional HTTP, which follows a strict request-response model.

---

## 🧠 What is a WebSocket?

A [**WebSocket**](https://en.wikipedia.org/wiki/WebSocket) is a communication protocol that provides full-duplex (two-way) channels over a single, long-lived TCP connection.  
Unlike HTTP, WebSockets do not follow a request-response cycle - they allow the server to push data to the client whenever it wants, and vice versa.

This makes them ideal for applications that require real-time data flow.

---

## 🚦 What can you do?

With the WebSocket library, you can:

- **Connect** to a WebSocket server using [`#!luau WebSocket.connect`](./connect.md)
- **Send** messages using [`#!luau WebSocket:Send`](./send.md)
- **Close** the connection manually using [`#!luau WebSocket:Close`](./close.md)
- **Listen** for incoming messages via the [`#!luau WebSocket.OnMessage`](./onmessage.md) [event](https://create.roblox.com/docs/scripting/events)
- **Respond** to disconnection events via [`#!luau WebSocket.OnClose`](./onclose.md)

---

## 🚫 What can't you do?

Although WebSockets are powerful, there are a few limitations, especially when used with certain executors:

- Binary frames (e.g. blobs or buffers) are **not supported** - all data must be sent as plain text
- This library is **client-only** - you cannot create a WebSocket server
- Secure WebSocket connections (`wss://`) only work if your executor supports SSL/TLS properly

    > In practice, many developers use external libraries for WebSocket communication and treat this wrapper as a lightweight bridge, so support for SSL/TLS should be fine in general.

    !!! info "sUNC Checks for WSS support"

        Please note that WebSocket tests will **fail** if your executor doesn't support WSS.
