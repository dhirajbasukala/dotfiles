return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    -- In the snacks explorer/pickers, both the closed (󰉋) and open (󰝰) folder
    -- glyphs are drawn with the same highlight (mini.icons -> MiniIconsAzure,
    -- blue). Only the glyph changes when expanded, not the color. Patch the file
    -- formatter to gray the icon for *closed* folders only; expanded folders keep
    -- their default color.
    local Format = require("snacks.picker.format")
    if not Format._gray_closed_folder then
      Format._gray_closed_folder = true
      local file = Format.file
      Format.file = function(item, picker)
        local ret = file(item, picker)
        if item.dir and not item.open then
          for _, seg in ipairs(ret) do
            if seg.virtual then -- the icon segment
              seg[2] = "MiniIconsGrey"
              break
            end
          end
        end
        return ret
      end
    end

    -- Arrow key + Tab navigation inside picker input
    opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
      win = {
        input = {
          keys = {
            ["<Down>"] = { "list_down", mode = { "i", "n" } },
            ["<Up>"] = { "list_up", mode = { "i", "n" } },
            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
    })

    -- Suppress E325 swap file warning when picker jumps to a file
    opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
      actions = {
        jump = function(picker, item)
          vim.opt.shortmess:append("A")
          require("snacks.picker.actions").jump(picker, item)
        end,
      },
    })

    return opts
  end,
}
