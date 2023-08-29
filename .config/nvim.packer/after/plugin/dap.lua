local ok_dap, dap = pcall(require, "dap")
local ok_dapui, dapui = pcall(require, "dapui")
local ok_dapvirtual, dapvirtual = pcall(require, "nvim-dap-virtual-text")
vim.cmd([[
    augroup daprepl
    autocmd FileType dap-repl set nobuflisted
    augroup end
]])
-- Debugging
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>" )
vim.keymap.set("n", "<F10>",":lua require'dap'.step_over()<CR>" )
vim.keymap.set("n", "<F11>",":lua require'dap'.step_into()<CR>" )
vim.keymap.set("n", "<F12>",":lua require'dap'.step_out()<CR>" )
vim.keymap.set("n", "<leader>b",":lua require'dap'.toggle_breakpoint()<CR>" )
vim.keymap.set("n", "<leader>lp",":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" )
vim.keymap.set("n", "<leader>B",":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" )
vim.keymap.set("n", "<leader>dt",":lua require'dap'.debug_text()<CR>" )
vim.keymap.set("n", "<leader>do",":lua require'dapui'.open()<CR>" )
vim.keymap.set("n", "<leader>dc",":lua require'dapui'.close()<CR>" )

local ready = ok_dapui and ok_dapvirtual and ok_dap
if not ready then
    do
        return
    end
end

dapui.setup()
dapvirtual.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
    dapui.close()
end
