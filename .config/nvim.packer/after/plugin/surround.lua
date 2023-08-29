local ok, surround = pcall(require, "surround")

if ok then
    surround.setup({ mappings_style = "surround" })
end

-- local ok_surround, kyle_surround = pcall(require, "nvim-surround")
--
-- if ok_surround then
--     kyle_surround.setup()
-- end
