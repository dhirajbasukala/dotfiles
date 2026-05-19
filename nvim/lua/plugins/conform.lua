return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    local prettier = { "prettierd", "prettier", stop_after_first = true }
    local web_fts = {
      "html", "css", "scss", "javascript", "javascriptreact",
      "typescript", "typescriptreact", "vue", "json", "yaml", "markdown",
    }
    for _, ft in ipairs(web_fts) do
      opts.formatters_by_ft[ft] = prettier
    end
    opts.formatters_by_ft.go = { "gofmt", "goimports" }
  end,
}
