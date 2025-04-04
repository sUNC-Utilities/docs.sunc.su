# Security Context Levels (`ThreadIdentity`)

Roblox uses **security context levels**, also known as **thread identities**, to determine what permissions a given script or thread has. These are primarily relevant when using functions like [`#!luau setthreadidentity`](./setthreadidentity.md) and [`#!luau getthreadidentity`](./getthreadidentity.md).

Identities are implemented as an internal [`#!cpp enum`](https://www.w3schools.com/cpp/cpp_enum.asp) within Roblox C++, which assigns each level a number. These values determine access to sensitive APIs like CoreGui, object creation, and replication internals.

---

## Identity Levels

Here is an overview of commonly known identity levels:

| Name                         | Value | Description                                                                 |
|------------------------------|--------|-----------------------------------------------------------------------------|
| `Anonymous`                  | `0`    | Default identity for unsandboxed/unauthenticated threads.                   |
| `LocalGUI_`                 | `1`    | Scripts initiated from Studio GUI or user input.                            |
| `GameScript_`              | `2`    | Normal scripts (e.g., LocalScript or Script in a live place).               |
| `GameScriptInRobloxPlace_` | `3`    | Same as above, but for Roblox-authored places.                              |
| `RobloxGameScript_`        | `4`    | Roblox-authored scripts with elevated access.                               |
| `CmdLine_`                 | `5`    | Code executed from the Studio command bar.                                  |
| `StudioPlugin` *(Studio only)* | `6` | Used internally for Studio plugins. Not present in live client builds.      |
| `COM`                      | `7` or `6` | External API scripts (e.g., COM interop or HTTP API).                     |
| `WebService`              | `8` or `7` | Scripts executed through Roblox web service infrastructure.               |
| `Replicator_`             | `9` or `8` | Internal replication systems.                                             |

---

## Differences between Studio and Client

In Roblox **Studio**, the [`#!cpp enum`](https://www.w3schools.com/cpp/cpp_enum.asp) includes `StudioPlugin`, which shifts subsequent values **up by 1**. In the **live client**, this value is missing, causing a shift **down by 1**.

| Identity Name         | Studio Value | Client Value |
|-----------------------|--------------|--------------|
| `StudioPlugin`        | `6`          | *(not present)* |
| `COM`                 | `7`          | `6`          |
| `WebService`          | `8`          | `7`          |
| `Replicator_`         | `9`          | `8`          |

This distinction is critical when working with [`#!luau setthreadidentity`](./setthreadidentity.md), especially if you're trying to use internal APIs in different environments.

---

> This document is based on known reverse-engineering efforts and developer documentation, but some identity levels may no longer be accurate as data here is from 2016 sources.
