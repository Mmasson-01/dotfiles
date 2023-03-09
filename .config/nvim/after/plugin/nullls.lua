local ok, nullls = pcall(require, "null-ls")
local check_eslint_config = function (utils)
    return utils.root_has_file({".eslintrc", ".eslintrc.js"})
end
local check_prettier_config = function (utils)
    return utils.root_has_file({".prettierrc"})
end

if ok then
    local sources = {
        nullls.builtins.formatting.prettier.with({
            condition = check_prettier_config
        }),
        nullls.builtins.formatting.eslint.with({
            condition = check_eslint_config
        }),
        nullls.builtins.formatting.terraform_fmt.with({
            extra_filetypes = { "hcl" }
        }),
        nullls.builtins.code_actions.shellcheck

    }
    nullls.setup({ sources = sources, debug = true})
end

