# What is sUNC?

## 🧠 Overview

**sUNC** stands for **senS' Unified Naming Convention**. It is a verification tool that tests whether an executor can properly run essential global functions, based on the [original Unified Naming Convention (UNC)](https://github.com/unified-naming-convention/NamingStandard/tree/main).

Whereas the original UNC standard was designed as a naming consistency guideline, **sUNC actively verifies behaviour** - not just presence. It tests functions in real-world usage scenarios to ensure they are **not spoofed**, **non-functional**, or **silently failing**.

> We're not calling UNC "bad" - it simply wasn't intended for deep compatibility testing. sUNC builds on the idea, but targets real execution fidelity.

---

## ❓ How do I know what failed?

Even though the main sUNC script is obfuscated to prevent spoofing, **we do not gatekeep** its tests.

If you're unsure why your executor is failing a test:

- **Join the sUNC Discord to discuss with the owner and other developers**
- **Check the Developer Console in-game** - detailed failure messages appear at the top.

The obfuscation exists only to discourage fake compliance from executors, many of which already spoof their behaviour to pass the [original UNC](https://github.com/unified-naming-convention/NamingStandard/tree/main) suite.

---

## 🔮 Will sUNC be discontinued?

**sUNC has no plans to shut down any time soon.**

If it ever is discontinued, the full source will be made **public within 1-2 months** to preserve transparency and help the community continue its development.

---

## 🙏 Credits

- [Original UNC Documentation](https://github.com/unified-naming-convention/NamingStandard/tree/main) - for laying the foundation  
