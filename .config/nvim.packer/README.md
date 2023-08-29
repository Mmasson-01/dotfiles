# Installation Manjaro

## Requirements

-   https://github.com/nvim-treesitter/nvim-treesitter
-   https://github.com/sharkdp/fd
-   https://github.com/BurntSushi/ripgrep
-   https://github.com/jesseduffield/lazygit
-   terraformls
-   tflint
-   eslint
-   prettier

## How to install

1. Install neovim from source to ensure you have 8.0+
2. Install TMUX
3. Install requirements
4. Copy the `nvim` directory into `~/.config/nvim
5. Source `packer.lua` and run `:PackerInstall` & `:PackerSync`

## If using TMUX

-   Install plugin manager TP - Install plugin manager TPMM
-   Source config file and run the following:

    ```
     C-b Shift i
    ```
