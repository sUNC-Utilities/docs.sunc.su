# Cryptography

!!! info

    sUNC does not check for every function contained within the original UNC. 

The **Cryptography** library provides a simple inferface for [Base64](https://en.wikipedia.org/wiki/Base64) encoding and decoding.

- [`#!luau crypt.base64decode(data: string): string`](./base64decode.md)
- [`#!luau crypt.base64encode(data: string): string`](./base64encode.md)

These allow you to convert binary data into a readable string format, and vice versa.

---

## ⚠️ Note on *"Security"*

Everyone should *hopefully* be aware that Base64 is **not encryption**. It is a reversible encoding method, and anyone can decode it.

Do **not** use Base64 to store or transmit sensitive or secure data - it offers zero protection.

The same caution applies to the other functions in this library. Though they may function correctly, they are prone to hooking, as they are global functions. If you're looking for security, it is recommended to use a custom/third-party library.
