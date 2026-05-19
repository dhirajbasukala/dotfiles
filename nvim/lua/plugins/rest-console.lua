return {
  "diepm/vim-rest-console",
  ft = "rest", -- lazy load on .rest files
  config = function()
    -- Optional: Configure vim-rest-console
    vim.g.vrc_trigger = "<C-j>" -- Default trigger key
    vim.g.vrc_output_buffer_name = "__REST_response__"
    vim.g.vrc_auto_format_response_enabled = 1
    vim.g.vrc_auto_format_response_patterns = {
      json = "jq",
      xml = "xmllint --format -",
    }
    -- Optional: Set curl options
    vim.g.vrc_curl_opts = {
      ["-sS"] = "",
      ["-i"] = "",
    }
  end,
}
