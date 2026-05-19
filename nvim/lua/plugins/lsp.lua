return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Override vtsls root_dir to avoid nested table crash in nvim 0.12.0-dev
        vtsls = {
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, {
              "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", ".git",
            }) or vim.fn.getcwd()
            on_dir(root)
          end,
        },
        -- Tailwind
        tailwindcss = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json")(
              fname
            )
          end,
        },

        -- ESLint
        eslint = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              "eslint.config.js",
              "package.json"
            )(fname) or util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },
}
