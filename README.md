![image](https://pub-17a0349a6dd0473f8502957f5c524d98.r2.dev/preview.png)

## Clone repository

Make sure to backup your current config. Then clone this repository to `~/.config/nvim`.

```sh
git clone https://github.com/vloe/nvim ~/.config/nvim
```

## Install plugins

Navigate to the nvim config.

```sh
nvim ~/.config/nvim
```

Then run `PackerSync` to install all the plugins.

```sh
:PackerSync
```

## Install null-ls builtins

Install [eslint_d](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/07897774c3b2f14d71b2ca51f3014d1055da9657/doc/BUILTINS.md#eslint_d) for diagnostics and code actions.

```sh
npm install -g eslint_d
```

Install [prettierd](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/07897774c3b2f14d71b2ca51f3014d1055da9657/doc/BUILTINS.md#prettierd) for formatting.

```sh
npm install -g @fsouza/prettierd
```

Install [stylua](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/07897774c3b2f14d71b2ca51f3014d1055da9657/doc/BUILTINS.md#stylua) for formatting.

```sh
brew install stylua
```

## Install lspconfig language servers

Install [typescript](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver) language server.

```sh
npm install -g typescript typescript-language-server
```

Install [rust analyzer](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer) language server.

```sh
brew install rust-analyzer
```

Install [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) language server.

```sh
npm install -g @tailwindcss/language-server
```

Install [svelte](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#svelte) language server.

```sh
npm install -g svelte-language-server
```

Install [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) language server.

```sh
npm i -g vscode-langservers-extracted
```

Install [astro](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro) language server.

```sh
npm i -g @astrojs/language-server
```

## iTerm2 settings

- Appearance/General/`Theme`: Minimal
- Appearance/Windows/`Hide scrollbars`: True
- Appearance/Panes/
  - `Side margins`: 1
  - `Top & bottom margins`: 2
- Profiles/Colors/`Background`: 17181b
- Profiles/Text/
  - `Font`: [SauceCodePro Nerd Font](https://www.nerdfonts.com/font-downloads)
  - `Font size`: 15
- Profiles/Window/`Custom window title`: True (and i've got it empty)
- General/Services/`Update to Beta test releases`: True (to be able to have squiggly lines)

## Credits

- lsp/cmp stuff: [kutsan's config](https://github.com/kutsan/dotfiles/tree/master/.config/nvim)
- design inspo: [alex35mil's config](https://github.com/alex35mil/dotfiles)
- config structure: [Josean Martinez's video](https://www.youtube.com/watch?v=vdn_pKJUda8)
