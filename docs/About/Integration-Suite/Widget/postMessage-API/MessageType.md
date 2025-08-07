# Widget API Message Types

## `#!ts sunc-widget:loadScrap`

Loads a test result from the provided `scrapId` and `accessKey`.

```ts
type LoadScrapPayload = {
  scrapId: string;
  key: string;
};
```

### Parameters

| Parameter      | Description                               |
| -------------- | ----------------------------------------- |
| `#!ts scrapId` | The unique ID of the test result.         |
| `#!ts key`     | The access key required to view the test. |

### Example

```ts title="Load a test result" linenums="1"
iframe.contentWindow.postMessage({
  type: "sunc-widget:loadScrap",
  payload: {
    scrapId: "abc123XYZ",
    key: "someAccessKey"
  }
}, "https://sunc.rubis.app");

```

---

## `#!ts sunc-widget:setTheme`

Updates the colour theme of the widget to match your branding. Any missing fields will fall back to defaults.

```ts
type ThemePayload = {
  dark?: string;
  light?: string;
  lighter?: string;

  sunc?: string;
  suncLighter?: string;

  grey?: string;
  lightText?: string;

  success?: string;
  failure?: string;

  useDarkLogo?: boolean;
};
```

### Parameters

| Parameter           | Description                                                                                          |
| ------------------- | ---------------------------------------------------------------------------------------------------- |
| `#!ts dark`         | The dark background colour.                                                                          |
| `#!ts light`        | The light card background colour.                                                                    |
| `#!ts lighter`      | An even lighter colour for highlights.                                                               |
| `#!ts sunc`         | Main sUNC accent colour.                                                                             |
| `#!ts suncLighter`  | Hover or accent variant of sUNC colour.                                                              |
| `#!ts grey`         | Neutral grey used for secondary elements.                                                            |
| `#!ts lightText`    | Main readable text colour.                                                                           |
| `#!ts success`      | Colour used for passed tests.                                                                        |
| `#!ts failure`      | Colour used for failed tests.                                                                        |
| `#!ts useDarkLogo` | A boolean indicating whether a logo suited for a light theme should be used. Default is `#!ts true`. |

### Logo Comparison

The sUNC logo shown in the top left of the widget can be customised depending on whether you intend to use a light theme or a dark theme. This is important to get right, otherwise you will have horrible contrast in the title bar of the widget.

If `#!ts useDarkLogo` is omitted entirely, then the widget defaults to `#! true` - it uses the dark logo by default.

#### `#!ts useDarkLogo: false`

When `#!ts useDarkLogo` is set to `#!ts false`, a light variant is used. This is perfect for when the background is dark as it provides enough contrast.

**Use this when you have a dark theme.**

![sUNC Full Light Logo](https://sunc.su/sunc-full.png)

#### `#!ts useDarkLogo: true`

When `#!ts useDarkLogo` is set to `#!ts true`, a dark variant is used. This is perfect for when the background is light as it provides enough contrast.

**Use this when you have a light theme.**

![sUNC Full Light Logo](https://sunc.su/sunc-full-dark.png?useNew)

### Examples

#### Example 1

??? info "Preview of the Creamy Pink theme"
    Not Initialised
    ![sUNC Widget Creamy Pink Theme, Not Initialised](./assets/creamypink-notinit.jpg)

    Spoofed
    ![sUNC Widget Creamy Pink Theme, Spoofed](./assets/creamypink-spoofed.jpg)

    Result
    ![sUNC Widget Creamy Pink Theme, Result](./assets/creamypink-result.jpg)

```ts title="Apply a light, creamy pink theme" linenums="1"
iframe.contentWindow.postMessage({
    type: "sunc-widget:setTheme",

    payload: {
        dark: "#fff0f5",
        light: "#fffbfc",
        lighter: "#ffeeee",

        sunc: "#ff6aa0",
        suncLighter: "#ff9abe",

        grey: "#888",
        lightText: "#444",

        success: "#44c26a",
        failure: "#e74c3c",

        useDarkLogo: true // (1)
    }
}, "https://sunc.rubis.app");
```

1. Set this to `#!ts true` when using light background colours.

#### Example 2

??? info "Preview of the Electric Yellow theme"
    Not Initialised
    ![sUNC Widget Electric Yellow Theme, Not Initialised](./assets/electricyellow-notinit.jpg)

    Spoofed
    ![sUNC Widget Electric Yellow Theme, Spoofed](./assets/electricyellow-spoofed.jpg)

    Result
    ![sUNC Widget Electric Yellow Theme, Result](./assets/electricyellow-result.jpg)

```ts title="Applying a dark, electric yellow theme" linenums="1"
iframe.contentWindow.postMessage({
    type: "sunc-widget:setTheme",

    payload: {
        dark: "#0f0f12",
        light: "#1a1a20",
        lighter: "#26262f",

        sunc: "#ffe600",
        suncLighter: "#fff36b",

        grey: "#999999",
        lightText: "#eeeeee",

        success: "#4caf50",
        failure: "#ff4b5c",

        useDarkLogo: false // (1)
    }
}, "https://sunc.rubis.app");
```

1. Set this to `#!ts false` when using dark background colours.

#### Example 3

??? info "Preview of the Default theme"
    Not Initialised
    ![sUNC Widget Default Theme, Not Initialised](./assets/default-notinit.jpg)

    Spoofed
    ![sUNC Widget Default Theme, Spoofed](./assets/default-spoofed.jpg)

    Result
    ![sUNC Widget Default Theme, Result](./assets/default-result.jpg)

```ts title="Applying a dark, electric yellow theme" linenums="1"
iframe.contentWindow.postMessage({
    type: "sunc-widget:setTheme",

    payload: {} // (1)
}, "https://sunc.rubis.app");
```

1. To revert back to the default theme, one may simply pass a message with an empty payload using the `postMessage` API.
