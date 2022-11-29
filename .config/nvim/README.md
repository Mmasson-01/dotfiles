# Installation Manjaro

## Requirements

-   https://github.com/nvim-treesitter/nvim-treesitter
-   https://github.com/sharkdp/fd
-   https://github.com/BurntSushi/ripgrep
-   https://github.com/jesseduffield/lazygit#void-linuxr

## How to install

1. Install neovim from source to ensure you have 8.0+
2. Install TMUX
3. Install

    - terraformls

        ```bash
        yay -S terraform-ls
        ```

    - tflint
        ```bash
        curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
        ```
    - prettier & eslint using npm (npm i -g prettier eslint)

4. Copy the `nvim` directory into `~/.config/nvim
5. Source `packer.lua` and run `:PackerInstall` & `:PackerSync`
6. Source `plug.lua` and run `:PlugInstall` & `:PlugSync`

### Treesitter install

1. Install HCL for terraform

    ```bash
    :TSInstall hcl
    ```

## If using TMUX

-   Install plugin manager TP - Install plugin manager TPMM
-   Source config file and run the following:

    ```
     C-b Shift i
    ```
