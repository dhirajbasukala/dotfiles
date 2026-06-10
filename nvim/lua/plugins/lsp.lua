return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Override vtsls root_dir to avoid nested table crash in nvim 0.12.0-dev
        vtsls = {
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, {
              "package-lock.json",
              "yarn.lock",
              "pnpm-lock.yaml",
              "bun.lockb",
              "bun.lock",
              ".git",
            }) or vim.fn.getcwd()
            on_dir(root)
          end,
        },
        -- Override biome root_dir to avoid nested table crash in nvim 0.12.0-dev
        -- (lspconfig passes grouped markers, but this nvim's vim.fs.root only takes a flat list)
        biome = {
          root_dir = function(bufnr, on_dir)
            local biome_config_files = { "biome.json", "biome.jsonc" }
            local root = vim.fs.root(bufnr, {
              "package-lock.json",
              "yarn.lock",
              "pnpm-lock.yaml",
              "bun.lockb",
              "bun.lock",
              "deno.lock",
              "biome.json",
              "biome.jsonc",
              ".git",
            }) or vim.fn.getcwd()

            -- Only attach biome if a biome config exists in the buffer's directory tree
            local filename = vim.api.nvim_buf_get_name(bufnr)
            biome_config_files = require("lspconfig.util").insert_package_json(biome_config_files, "biomejs", filename)
            local using_biome = vim.fs.find(biome_config_files, {
              path = filename,
              type = "file",
              limit = 1,
              upward = true,
              stop = vim.fs.dirname(root),
            })[1]
            if using_biome then
              on_dir(root)
            end
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
          root_dir = function(bufnr)
            local util = require("lspconfig.util")
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local git_ancestor = vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
            return util.root_pattern(
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              "eslint.config.js",
              "package.json"
            )(fname) or git_ancestor
          end,
        },
      },
    },
  },
}
