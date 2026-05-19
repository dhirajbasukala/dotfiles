-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Only custom keymaps that differ from LazyVim defaults

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts) -- hover on gh (LazyVim uses K)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- shorter rename (LazyVim uses <leader>cr)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts) -- shorter format (LazyVim uses <leader>cf)

-- Increase height using Ctrl + Up Arrow
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n>:resize +3<CR>i", { desc = "Increase terminal height" })

-- Decrease height using Ctrl + Down Arrow
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n>:resize -3<CR>i", { desc = "Decrease terminal height" })
