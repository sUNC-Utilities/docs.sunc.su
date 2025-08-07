# `postMessage`

!!! info "Notes on `#!ts postMessage`"
    This function **only applies to websites embedding the sUNC Widget** via an `#!html <iframe>`. It allows you to dynamically interact with the widget by sending messages from your host page.

`#!ts postMessage` sends a typed message to a sUNC Widget iframe, allowing you to control its behaviour.

```ts
type SuncWidgetMessage =
  | {
    type: "sunc-widget:loadScrap";
    payload: {
      scrapId: string;
      key: string;
    };
  }
  | {
    type: "sunc-widget:setTheme";
    payload: {
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
  };

function postMessage(message: SuncWidgetMessage, targetOrigin: string): void;
```

## Parameters

| Parameter           | Description                                                                    |
| ------------------- | ------------------------------------------------------------------------------ |
| `#!ts message`      | The structured [message](./MessageType.md) to send to the sUNC widget. |
| `#!ts targetOrigin` | The expected origin of the iframe (`"https://sunc.rubis.app"`). |

---

## Notes

- `#!ts targetOrigin` **must exactly match** the origin of the iframe source to avoid your message being ignored.
- The widget ignores unknown or malformed message types.
- Missing theme properties in `setTheme` will fall back to the default sUNC palette.
