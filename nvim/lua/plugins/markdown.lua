return {
  -- Customizing the inline renderer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        sign = false, -- Disable header gutter icons if preferred
      },
      checkbox = {
        enabled = true, -- Keep interactive checklists on
      },
    },
  },
  -- Customizing the browser previewer
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Browser Preview Keymaps
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle", ft = "markdown" },
    },
  },

  -- Inline Render & Checkbox Keymaps
  {
    "MeanderingProgrammer/render-markdown.nvim",
    keys = {
      { "<leader>mt", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown Render Toggle", ft = "markdown" },
    },
  },
}
