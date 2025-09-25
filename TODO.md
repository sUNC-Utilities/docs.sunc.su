# To-Do List

This to-do list is split up into sections with tasks assigned to documentation maintainers.

## To-Do List for me (Richy)

- cross-reference with old documentation to ensure we arent missing any functions in the new documentation
- Write a linter for this documentation:
  - Warn when there is a `code snippet` that doesnt have syntax highlighting applied to it
  - It should not error when it encounters just one error immediately. errors/warnings for linting must be appended to an array and then printed last. os.exit code shoudl be error if strict errors appended but no os.exit error code if there are only warnings.
  - Must check when "Lua" is used individually instead of "Luau". also detect "Lua's", etc. because Luau is used, not Lua.
  - Must check when the long hyphens are used or the non-standard quotes are used (the fancy ones instead of the programmer ones)
  - add emoji checking, allowing them only on level 3 headings (`###`). nowhere else.
- ensure there is a luau type definition for the following things:
  - Drawing object
- search for code snippets and ensure they have relevant, appropriate links
- search for "TODO" messages to fix todo items
