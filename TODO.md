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

## Latest to-do list for Richy

- Clarify the transparency value in drawing !!!! BIG WARNING (RED)
- Make a document somewhere under the About section explaining why we dont test some functions from the original UNC, eg "Where is the cache library?"
  - "What happened to crypt?"
  - where are mouse funcs or isrbxactive etc?
- Create a new group, similar to the new base64 group (from crypt), documenting the lz4compress and the lz4decompress functions
- Potentially note that debug.getinfo is useless as we have better debug.info (just put this note in debug.getinfo, if you still want to implement getinfo then visit this link etc, but otherwise theyre somewhat similar)
  - "dont really care much about this function, but i think we should add it, since we did add setscriptable"
- create documentation for `decompile` under SCRIPTS (not reflection!) group, and also every other function mentioned [here](https://github.com/sUNC-Utilities/docs.sunc.su/issues/162)
  - <https://synapsexdocs.github.io/custom-lua-functions/reflection-functions/#decompile>
  - cross off items from same github issue
- create documentation for `getnamecallmethod` under metatable group
  - <https://github.com/unified-naming-convention/NamingStandard/blob/305c31e4f469c056812c9f412c9a4d78293021bc/api/metatable.md?plain=1#L77-L103>
  - <https://synapsexdocs.github.io/custom-lua-functions/misc-functions/#get-namecall-method>
  - <https://github.com/sUNC-Utilities/docs.sunc.su/issues/161>
- cache library, even though it may seem redundant in the meantime (it will be removed in the future from the next version of sUNC)
  - <https://synapsexdocs.github.io/libraries/syn/>
  - <https://github.com/unified-naming-convention/NamingStandard/blob/305c31e4f469c056812c9f412c9a4d78293021bc/api/cache.md?plain=1>
- `debug.getinfo`
  - <https://github.com/unified-naming-convention/NamingStandard/blob/305c31e4f469c056812c9f412c9a4d78293021bc/api/debug.md?plain=1#L70-L112>
  - <https://synapsexdocs.github.io/libraries/debug/#get-info>
- `isscriptable`
  - <https://github.com/unified-naming-convention/NamingStandard/blob/305c31e4f469c056812c9f412c9a4d78293021bc/api/instances.md?plain=1#L223-L242>
- lz4 functions (new group, based off new base64 group and old crypt group)
  - <https://github.com/unified-naming-convention/NamingStandard/blob/305c31e4f469c056812c9f412c9a4d78293021bc/api/misc.md?plain=1#L21-L63>
