# sUNC Documentation

Welcome to the official documentation for **sUNC** - senS' Unified Naming Convention.

This documentation site serves as the central knowledge base for understanding sUNC, how it works, and how to contribute to the project.

Whether you're an executor developer, a curious tester, or a contributor helping document functions, you're in the right place!

---

## 📚 Explore the Docs

- [What is sUNC?](./About/what-is-sunc.md)
- [How sUNC Test Results Work](./About/test-results.md)
- [How to Contribute](./About/contributing.md)

## 📜 The script

```luau title="The sUNC testing script" linenums="1"
getgenv().sUNCDebug = {
    ["printcheckpoints"] = false,
    ["delaybetweentests"] = 0
}

loadstring(game:HttpGet("https://script.sunc.su/"))() -- (1)
```

1. This loadstring uses [script.sunc.su](https://script.sunc.su/), an official mirror of the sUNC script. If the mirror is down or you would like to use the original loadstring, visit [this](https://gitlab.com/sens3/nebunu/-/raw/main/HummingBird8's_sUNC_yes_i_moved_to_gitlab_because_my_github_acc_got_brickedd/sUNCm0m3n7.lua).

Just so you know, as of sUNC v2.0, the test now only runs inside the official testing game. The latest one may be retrieved from [our Discord server](https://discord.gg/FNNfTUpFYv).

---

Thank you for being here.
