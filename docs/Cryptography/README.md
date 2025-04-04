# Cryptography

The **Cryptography** library provides a simple inferface for [Base64](https://en.wikipedia.org/wiki/Base64) encoding and decoding.

sUNC does not check for every function contained within the original UNC. We have reduced the cryptography functions to only essential/popular ones, namely Base64:

- [`#!luau crypt.base64decode(data: string): string`](./base64decode.md)
- [`#!luau crypt.base64encode(data: string): string`](./base64encode.md)

These allow you to convert binary data into a readable string format, and vice versa.

---

## ⚠️ Note on *"Security"*

Everyone should *hopefully* be aware that Base64 is **not encryption**. It is a reversible encoding method, and anyone can decode it.

Do **not** use Base64 to store or transmit sensitive or secure data - it offers zero protection.

---

This library should be simple dimple pop it squish: encode and decode. It is petite and reliable.
