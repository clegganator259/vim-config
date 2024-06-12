-- Here is the formatting config
local null_ls = require("null-ls")

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local lssources =

null_ls.setup({
    sources = {
        formatter.black, --python
        formatter.isort, --python
    },
})
