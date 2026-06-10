return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "oxfist/night-owl.nvim", name = "night-owl", priority = 1000 },
  { "EdenEast/nightfox.nvim" },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      -- vim.cmd.colorscheme("everforest")
    end,
  },
  -- {
  --   "vague2k/vague.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optional: setup with custom options
  --     require("vague").setup({
  --       transparent = false, -- change to true for transparent background
  --       style = {
  --         comments = "italic",
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   opts = {
  --     -- Optional: Configure Kanagawa. For example, to use a different theme.
  --     -- See `:help kanagawa.nvim` for all options.
  --     theme = "wave", -- 'wave', 'lotus', or 'dragon'
  --     compile = false, -- enable compiling the colorscheme (optional)
  --     undercurl = true, -- enable undercurls (optional)
  --     -- ... other configurations
  --   },
  --   -- Set this to `true` if you want to set the colorscheme immediately
  --   -- after the plugin is loaded, or omit this to manually set it later.
  --   -- lazy = false,
  --   -- priority = 1000, -- Set a higher priority to load it early (optional)
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000, -- load before other plugins
  --   opts = {
  --     style = "night", -- "storm" | "moon" | "night" | "day"
  --   },
  -- },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "green-owl",
    },
  },
}
