# To-Do List

Manually going through every bit of the old documentation (and the latest commits whilst doing this simultaneously) has taught me (Richy) a lot about sUNC and its functions. However it has also exposed many small mistakes/flaws in the original documentation which I referenced to make this entire repository.

Some things also require modification from the developer side, namely the following:

- Ensure that the sUNC testing game has support for the `replicatesignal` example tests as mentioend in [`replicatesignal`](./docs/Signals/replicatesignal.md).
- Provide me with documentation from `Drawing.Font` because that seems to be missing, or implement it yourself **whilst following the documentation standard**
- please confirm whether the scripts library does indeed allow interaction with Scripts (i.e. server scripts) because to me it seems a bit obvious that it should only be localscript and modulescripts bc executors are local lol. unless this is because most executors have identity 8 and can create new Script instnaces? anyways even if we can scan for Scripts, it would be nice to add a warning about not being able to inspect their contents because theyre server sided
- Please check if [ThreadIdentity](./docs/Reflection/ThreadIdentity.md) is correct - I used 2016 source for these so they might not be super accurately up to date
- search for "TODO" in repo. there is only one note for you which you must verify inside of [here](./docs/Welcome%20to%20sUNC/test-results.md)

## To-Do List for me (Richy)

- Change contribution standard to ensure that functions with no arguments should still have a parameters section, although using the "empty" template.
- Ensure snake_case compliance (will come in review 2 of the entire repository)
- Specify in documentation standard that "an" and "a" should be based off of how a word SOUNDS in front of it, and not a strict vowel check.
- Write a linter for this documentation:
  - Warn when there is a `code snippet` that doesnt have syntax highlighting applied to it
  - It should not error when it encounters just one error immediately. errors/warnings for linting must be appended to an array and then printed last. os.exit code shoudl be error if strict errors appended but no os.exit error code if there are only warnings.
  - Must check when "Lua" is used individually instead of "Luau". also detect "Lua's", etc. because Luau is used, not Lua.
  - Must check when the long hyphens are used or the non-standard quotes are used (the fancy ones instead of the programmer ones)
  - add emoji checking, allowing them only on level 3 headings (`###`). nowhere else.
- In the documentation standard, mention how contractions like "isn't" and "can't" shouldnt be use. e.g. use "it is" instead of "it's" (Also check for contractions in review 2)
- ensure there is a luau type definition for the following things:
  - Drawing object ✅
  - filtergc function filter options ✅
  - filtergc table filter options ✅
- Update documentation with changed for hookmetamethod, named "pixe***** yap" in old docs commit
- Write example pages in contributing section:
  - an entire bogus library example
  - two functions in this example library
  - and a separate page for a special object in this library
  - with examples etc of course
  - also include an example of a function with no args to show the no parameters table
  - first example could be print
  - second example could be loadstring
  - third example could be printidentity to showcase no param function
  - of course this entire example library would have search indexing disabled in documentation
- maybe write a templates directory inside of contribution which contains the annotations like `!!! info` etc, empty parameter tables, code snippets with syntax highlighting, etc. essentially a cheat sheat.
- include compareinstances from latest commit to old docs
- contribution guidelines must mention that markdown MUST be formatted/linted using david anson's markdownlint plugin in vscode. too bad jetbrains users
- to prevent commit/push/pull conflicts, all updatees must be done via Pull Requests, including administrators. this allows peer review and also prevents branch hell, commit hell etc by just reviewing and then merging the branch.
- search for code snippets and ensure they have relevant, appropriate links
- search for "TODO" messages to fix todo items
