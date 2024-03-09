vim.g.mapleader = " "
-- Open directory view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>sv", function()dofile(vim.env.MYVIMRC)end)

-- When in visual mode J and K move highlighted block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't move cursor when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- When making large moves (u, d or search) ensure the cursor is in the middle
-- of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Replaces current selection with whatever is in the paste buffer without
-- overwriting buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete without keeping yanked value
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Format file using lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Maps moving between vim panes using standard navigation
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
