![image](https://pub-17a0349a6dd0473f8502957f5c524d98.r2.dev/preview.png)

## Clone repository

Make sure to backup your current config. Then clone this repository to `~/.config/nvim`.

```sh
git clone https://github.com/vloe/nvim ~/.config/nvim
```

### Install plugins

Navigate to the nvim config.

```sh
nvim ~/.config/nvim
```

Then run `PackerSync` to install all the plugins.

```sh
:PackerSync
```

### Install null-ls builtins

```sh
npm install -g eslint_d @fsouza/prettierd
```

```sh
brew install stylua
```

### Install lspconfig language servers

```sh
npm install -g typescript typescript-language-server @tailwindcss/language-server svelte-language-server vscode-langservers-extracted @astrojs/language-server
```

```sh
brew install rust-analyzer
```

## iTerm2 settings

- Appearance/General/`Theme`: Minimal
- Appearance/Windows/`Hide scrollbars`: True
- Appearance/Panes/
  - `Side margins`: 1
  - `Top & bottom margins`: 2
- Profiles/Colors/
  - `Background`: 17181b
  - `Foreground`: 9da2af
- Profiles/Text/
  - `Font`: [SauceCodePro Nerd Font](https://www.nerdfonts.com/font-downloads)
  - `Font size`: 15
- Profiles/Window/`Custom window title`: True (and i've got it empty)
- General/Services/`Update to Beta test releases`: True (to be able to have squiggly lines)

## Credits

- lsp/cmp stuff: [kutsan's config](https://github.com/kutsan/dotfiles/tree/master/.config/nvim)
- design inspo: [alex35mil's config](https://github.com/alex35mil/dotfiles)
- config structure: [Josean Martinez's video](https://www.youtube.com/watch?v=vdn_pKJUda8)
