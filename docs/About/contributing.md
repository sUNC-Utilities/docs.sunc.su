# How to contribute

Welcome to the sUNC documentation project! We worked tirelessly to standardise and make the documentation beautiful and readable for everyone.

This guide outlines the official standards for contributing to the sUNC documentation, including how libraries and functions should be structured and written.

Consistency makes our documentation readable, searchable, and enjoyable to explore.

---

## Documenting entire libraries

Each library **must** be placed in a folder named after the library itself. Inside this folder, you must include a `README.md` file, which serves as the **index page** for that library, in both this documentation website and also when browsing the documentation repository on GitHub.

### Index page requirements

- Introduce the purpose of the library
- Summarise what you **can** and **cannot** do with it

Index pages *do not* need to follow this strict format, but they should ***aim*** for clarity and helpfulness.

---

## General documentation style

All documentation pages (including function pages and index pages) **must**:

- Use inline links to relevant [Wikipedia](https://wikipedia.org), [Roblox Luau](https://create.roblox.com/docs), or other sUNC pages with referencing key terms.
- Use the correct inline link formats, e.g.:

    ```md
    [`#!luau task.defer`](https://create.roblox.com/docs/reference/engine/libraries/task#defer)
    ```

    As you can see, the example above uses a code snippet with `luau` syntax highlighting enabled, whilst also being a hyperlink to the Roblox API documentation for [`#!luau task.defer`](https://create.roblox.com/docs/reference/engine/libraries/task#defer).

---

## Function Documentation

Each function must have **its own file**, named after the function (e.g. `newcclosure.md`).

### Title Format

The title of the page must be written as:

```md
# `function_name`
```

!!! failure "Important"

    Do not include emojis in function **titles**.

### Notices

Place all important `!!!` callouts (warnings, errors, info) **immediately under the title**. These should include anything the user must know before using the function.

---

### Description

Provide a description of the function directly after any notices.

When referencing the function name, **always** use the code snippet format:

```md
`#!luau function_name` allows you to do this and that.
```

---

### Type Definition

!!! info "Type definitions are incredibly important!"

    You **must** always include a Luau-style type definition when documenting a function.

Always include the Luau type definition **at the bottom of the first section**, with Luau syntax highlighting but **no *individual line highlighting* or line numbers**:

```luau
function newcclosure<A..., R...>(function_to_wrap: (A...) -> R...): (A...) -> R...
```

Make sure it precedes the parameters table.

---

### Parameters

The parameters must always be neatly described in a function, like so:

```md
## Parameters

| Parameter               | Description                         |
|-------------------------|-------------------------------------|
| `#!luau parameter_name` | Short description of the parameter. |
```

Use [**snake_case**](https://en.wikipedia.org/wiki/Snake_case) for **every variable**, and [**camelCase**](https://en.wikipedia.org/wiki/Camel_case) for **parameters** to distinguish them visually from Roblox instances or Luau objects.

There should be **no horizontal rule** (`---`) between the *type definition* and the *parameters* section.

---

### Providing users with examples

Every function page **must** include at least one example.

!!! info "Use 'Example' or 'Examples' based on how many examples you have"

    To make the documentation experience more logical and also grammatically correct, please do the following:
    - Make the heading `#!md ## Example` if there is only one example.
    - Make the heading `#!md ## Examples` if there is more than one example.
        Each example should have its own subheading, e.g. `#!md ### Example 1`, `#!md ### Example 2`

Each example should use the following format:

```md
## Example

` ` `luau title="Short but descriptive title for your code" linenums="1"
-- an example is here
print("Hello world!")
print("This is some example code")
` ` `

```

- Examples must use `luau` syntax highlighting
- Line numbers **must** be enabled using `linenums="1"`
- Each example **must** have a `title` describing in short what the code does.