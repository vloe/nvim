![image](https://vloe-imgs.s3.eu-west-2.amazonaws.com/nvim1.png)

## clone repo

make sure to backup your current config. then clone the repo to `~/.config/nvim`.

```sh
git clone https://github.com/vloe/nvim ~/.config/nvim
```

## hyper config

```js
"use strict";
module.exports = {
  config: {
    updateChannel: "stable",
    fontSize: 13,
    fontFamily: "SauceCodePro Nerd Font",
    fontWeight: "normal",
    fontWeightBold: "bold",
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: "#957fb8", // purple
    cursorAccentColor: "#000",
    cursorShape: "BLOCK",
    cursorBlink: false,
    foregroundColor: "#fff",
    backgroundColor: "#000",
    selectionColor: "#151515", // strong faded gray
    borderColor: "#303030", // faded gray
    // adds an icon top middle
    css: `
    .header_header { 
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }
    .header_header::before { 
        content: 'ɣ';
        position: absolute;
        color: #fff;
        font-size: 14px;
        z-index: 9999;
    }
    `,
    termCSS: "",
    workingDirectory: "",
    showHamburgerMenu: "",
    showWindowControls: "",
    padding: "12px 14px",
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

## credits

- folder structure, lsp and lazy: [josean martinez](https://github.com/josean-dev/dev-environment-files)
