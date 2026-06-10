-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Only custom keymaps that differ from LazyVim defaults

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts) -- hover on gh (LazyVim uses K)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- shorter rename (LazyVim uses <leader>cr)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts) -- shorter format (LazyVim uses <leader>cf)

local function resize_term(amount)
  local mode = vim.api.nvim_get_mode().mode

  if mode == "t" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
  end

  vim.cmd("resize " .. (amount > 0 and "+" or "") .. amount)

  -- Return to terminal mode only if we were in it
  if mode == "t" then
    vim.cmd("startinsert")
  end
end

vim.keymap.set("t", "<M-Up>", function()
  resize_term(3)
end, { desc = "Increase terminal height", nowait = true })
vim.keymap.set("t", "<M-Down>", function()
  resize_term(-3)
end, { desc = "Decrease terminal height", nowait = true })
vim.keymap.set("n", "<M-Up>", function()
  resize_term(3)
end, { desc = "Increase terminal height", nowait = true })
vim.keymap.set("n", "<M-Down>", function()
  resize_term(-3)
end, { desc = "Decrease terminal height", nowait = true })
