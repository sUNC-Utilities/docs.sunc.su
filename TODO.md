# To-Do List

Manually going through every bit of the old documentation (and the latest commits whilst doing this simultaneously) has taught me (Richy) a lot about sUNC and its functions. However it has also exposed many small mistakes/flaws in the original documentation which I referenced to make this entire repository.

## To-Do List for me (Richy)

- cross-reference with old documentation to ensure we arent missing any functions in the new documentation
- Specify in documentation standard that "an" and "a" should be based off of how a word SOUNDS in front of it, and not a strict vowel check.
- Write a linter for this documentation:
  - Warn when there is a `code snippet` that doesnt have syntax highlighting applied to it
  - It should not error when it encounters just one error immediately. errors/warnings for linting must be appended to an array and then printed last. os.exit code shoudl be error if strict errors appended but no os.exit error code if there are only warnings.
  - Must check when "Lua" is used individually instead of "Luau". also detect "Lua's", etc. because Luau is used, not Lua.
  - Must check when the long hyphens are used or the non-standard quotes are used (the fancy ones instead of the programmer ones)
  - add emoji checking, allowing them only on level 3 headings (`###`). nowhere else.
- In the documentation standard, mention how contractions like "isn't" and "can't" shouldnt be use. e.g. use "it is" instead of "it's" (Also check for contractions in review 2)
- ensure there is a luau type definition for the following things:
  - Drawing object
  - filtergc function filter options ✅
  - giltergc table filter options ✅
- Update documentation with changed for hookmetamethod, named "pixe***** yap" in old docs commit
- maybe write a templates directory inside of contribution which contains the annotations like `!!! info` etc, empty parameter tables, code snippets with syntax highlighting, etc. essentially a cheat sheat.

- contribution guidelines must mention that markdown MUST be formatted/linted using david anson's markdownlint plugin in vscode. too bad jetbrains users
- search for code snippets and ensure they have relevant, appropriate links
- search for "TODO" messages to fix todo items
