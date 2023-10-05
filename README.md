![image](https://pub-17a0349a6dd0473f8502957f5c524d98.r2.dev/preview.png)

## Clone repository

Make sure to backup your current config. Then clone this repository to `~/.config/nvim`.

```sh
git clone https://github.com/vloe/nvim ~/.config/nvim
```

## Hyper config

```js
"use strict";
module.exports = {
  config: {
    updateChannel: "stable",
    fontSize: 15,
    fontFamily: "SauceCodePro Nerd Font",
    fontWeight: "normal",
    fontWeightBold: "bold",
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: "#957FB8", // oniViolet (kanagawa colorscheme)
    cursorAccentColor: "#000",
    cursorShape: "BLOCK",
    cursorBlink: false,
    foregroundColor: "#9da2af",
    backgroundColor: "#17181b",
    selectionColor: "#1c1e20",
    borderColor: "#333",
    css: "",
    termCSS: "",
    workingDirectory: "",
    showHamburgerMenu: "",
    showWindowControls: "",
    padding: "10px 10px",
    colors: {
      black: "#000000",
      red: "#C51E14",
      green: "#1DC121",
      yellow: "#C7C329",
      blue: "#0A2FC4",
      magenta: "#C839C5",
      cyan: "#20C5C6",
      white: "#C7C7C7",
      lightBlack: "#686868",
      lightRed: "#FD6F6B",
      lightGreen: "#67F86F",
      lightYellow: "#FFFA72",
      lightBlue: "#6A76FB",
      lightMagenta: "#FD7CFC",
      lightCyan: "#68FDFE",
      lightWhite: "#FFFFFF",
      limeGreen: "#32CD32",
      lightCoral: "#F08080",
    },
    shell: "",
    shellArgs: ["--login"],
    env: {},
    bell: "SOUND",
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: "vertical",
    webGLRenderer: true,
    webLinksActivationKey: "",
    disableLigatures: true,
    disableAutoUpdates: false,
    screenReaderMode: false,
    preserveCWD: true,
  },
  plugins: [],
  localPlugins: [],
  keymaps: {},
};
```

## Credits

- Folder structure, lsp and lazy: [Josean Martinez](https://github.com/josean-dev/dev-environment-files).
