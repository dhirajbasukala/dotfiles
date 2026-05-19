-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Show relative file path in each window's top bar (helps distinguish same-name files)
vim.opt.winbar = "%f"

-- Fix gf for JS/Vue imports: resolve @ alias, strip quotes, add .vue support
-- (gd is handled by LSP via the Vue extra; this covers Vim's built-in gf)
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript", "javascriptreact", "vue" },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.bo[bufnr].path = ".,src"
    vim.bo[bufnr].suffixesadd = ".js,.jsx,.vue"

    _G.gf_resolve = function(fname)
      local path = vim.fn.fnamemodify(fname, ":r")
      path = path:gsub('^"', ""):gsub('"$', "")
      path = path:gsub("^@/", "src/")
      return vim.fn.fnamemodify(path, ":p")
    end
    vim.bo[bufnr].includeexpr = "v:lua.gf_resolve(v:fname)"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.b.autoformat = false
  end,
})
