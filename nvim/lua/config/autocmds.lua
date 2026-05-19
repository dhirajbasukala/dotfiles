-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- todo-comments.nvim (bundled with LazyVim) already handles TODO/FIXME/NOTE highlighting
vim.filetype.add({
  pattern = {
    [".*%.env"] = "sh",
  },
})

