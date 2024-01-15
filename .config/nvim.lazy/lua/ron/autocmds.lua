-- AUTO COMMANDS
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { ".yabairc" },
    command = "!yabai --restart-service",
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { ".skhdrc" },
    command = "!skhdrc --restart-service",
})
local function augroup(name)
    return vim.api.nvim_create_augroup("custom_au_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
    pattern = { "*.mdx", "*.md" },
    callback = function()
        vim.cmd([[set filetype=markdown wrap linebreak nolist nospell]])
    end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.conf" },
    callback = function()
        vim.cmd([[set filetype=sh]])
    end,
})

-- hashivim terraform
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1

-- ansible-vim
vim.cmd(
    [[au BufRead *.yaml,*.yml if search('hosts:\|tasks:\|roles:', 'nw') | set ft=yaml.ansible | endif]]
)
vim.cmd([[au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible]])

-- GO TEMPL PLUGIN https://templ.guide/commands-and-tools/ide-support/
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
-- Format current buffer using LSP.
vim.api.nvim_create_autocmd({
    -- 'BufWritePre' event triggers just before a buffer is written to file.
    "BufWritePre",
}, {
    pattern = { "*.templ" },
    callback = function()
        -- Format the current buffer using Neovim's built-in LSP (Language Server Protocol).
        vim.lsp.buf.format()
    end,
})

-- CUSTOM AUTOCOMMAND
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

--
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
        local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
        params.context = { only = { "source.organizeImports" } }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
                else
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end
    end,
})
