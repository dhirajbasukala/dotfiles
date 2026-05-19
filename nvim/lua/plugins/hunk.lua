return {
  "julienvincent/hunk.nvim",
  cmd = { "DiffEditor" },
  opts = {
    keys = {
      global = {
        quit = { "q" },
        accept = { "<leader><Cr>" },
        focus_tree = { "<leader>e" },
      },

      tree = {
        expand_node = { "l", "<Right>" },
        collapse_node = { "h", "<Left>" },

        open_file = { "<Cr>" },

        toggle_file = { "a" },
      },

      diff = {
        toggle_hunk = { "A" },
        toggle_line = { "a" },
        toggle_line_pair = { "s" },

        prev_hunk = { "[h" },
        next_hunk = { "]h" },

        toggle_focus = { "<Tab>" },
      },
    },

    ui = {
      tree = {
        mode = "nested",
        width = 35,
      },
      layout = "vertical",
      confirm_before_quit = false,
    },

    icons = {
      enable_file_icons = true,

      selected = "󰡖",
      deselected = "",
      partially_selected = "󰛲",

      folder_open = "",
      folder_closed = "",

      expanded = "",
      collapsed = "",
    },

    hooks = {
      ---@param _context { buf: number, tree: NuiTree, opts: table }
      on_tree_mount = function(_context) end,
      ---@param _context { buf: number, win: number }
      on_diff_mount = function(_context) end,
    },
  },
}
