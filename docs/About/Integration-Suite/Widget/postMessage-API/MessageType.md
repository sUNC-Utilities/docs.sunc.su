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

| Parameter        | Description                               |
| ---------------- | ----------------------------------------- |
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
};
```

### Parameters

| Parameter            | Description                               |
| -------------------- | ----------------------------------------- |
| `#!ts dark`        | The dark background colour.               |
| `#!ts light`       | The light card background colour.         |
| `#!ts lighter`     | An even lighter colour for highlights.    |
| `#!ts sunc`        | Main sUNC accent colour.                  |
| `#!ts suncLighter` | Hover or accent variant of sUNC colour.   |
| `#!ts grey`        | Neutral grey used for secondary elements. |
| `#!ts lightText`   | Main readable text colour.                |
| `#!ts success`     | Colour used for passed tests.             |
| `#!ts failure`     | Colour used for failed tests.             |

### Example

```ts title="Apply a pink theme" linenums="1"
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
    failure: "#e74c3c"
  }
}, "https://sunc.rubis.app");

```
