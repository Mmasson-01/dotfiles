# Installation Manjaro

## Requirements

- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/sharkdp/fd
- https://github.com/BurntSushi/ripgrep
- https://github.com/ggreer/the_silver_searche
- https://github.com/jesseduffield/lazygit#void-linuxr

## How to install

1. Install neovim & tmux and the following dependencies

   - tpm
   - terraformls
    ```bash
    yay -S terraform-ls
    ```
   - tflint
    ```bash
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
    ```

2. Run in tmux the following to install the Tmux theme:
   **Note**: Ensure you have the .tmux.conf.
   ```
    C-b Shift i
   ```
3. Copy the `nvim` directory into `~/.config/nvim
4. Source `packer.lua` and run `:PackerInstall` & `:PackerSync`
5. Source `plug.lua` and run `:PlugInstall` & `:PlugSync`
6. Install Tree-sitter HCL with `:TSInstall hcl`
