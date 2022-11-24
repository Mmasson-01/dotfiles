# Installation Manjaro

## Requirements

- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/sharkdp/fd
- https://github.com/BurntSushi/ripgrep
- https://github.com/ggreer/the_silver_searcher

## How to install

1. Install neovim & tmux and the following dependencies

   - tpm
   - terraformls
   - tflint

2. Run in tmux the following to install the Tmux theme:
   **Note**: Ensure you have the .tmux.conf.
   ```
   C-b Shift i
   ```
3. Copy the `nvim` directory into `~/.config/nvim
4. Source `packer.lua` and run `:PackerInstall` & `:PackerSync`
5. Source `plug.lua` and run `:PlugInstall` & `:PlugSync`
