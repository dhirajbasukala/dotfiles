return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>df", -- Example keymap (space + g + d)
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "Toggle Diffview window",
    },
    -- Add a keymap to open Diffview with a specific command
    {
      "<leader>gdh",
      function()
        vim.cmd("DiffviewOpen HEAD~1..HEAD") -- Example: compare current state to last commit
      end,
      desc = "Diff with last commit",
    },
  },
}
