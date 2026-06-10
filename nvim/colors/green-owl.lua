-- green-owl.nvim
-- Night Owl variant with a dark, dull (desaturated) green background
-- instead of dark blue. Sibling of gray-owl.
-- Drop into ~/.config/nvim/colors/green-owl.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "green-owl"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Palette
-- Night Owl original bg: #011627 (very dark blue)
-- Shifted to dark, dull green equivalents (low-saturation, gray-green):
local c = {
  bg = "#161d16", -- main background (dark dull green)
  bg_dark = "#0e130e", -- darker panels / sidebars
  bg_lighter = "#1f271f", -- float / popup bg
  bg_highlight = "#283028", -- cursorline, visual
  bg_visual = "#333d33", -- visual selection
  border = "#3a443a", -- borders / window separators

  fg = "#d6deeb", -- main foreground (unchanged from Night Owl)
  fg_dim = "#7986a3", -- comments, dimmed text
  fg_dark = "#4c566a", -- very dim / linenr

  -- Syntax colors — kept identical to Night Owl
  cyan = "#80cbc4",
  green = "#addb67",
  green_light = "#ecc48d", -- strings in Night Owl are actually warm yellow-green
  yellow = "#ffcb8b",
  orange = "#f78c6c",
  red = "#ff5874",
  magenta = "#c792ea",
  blue = "#82aaff",
  sky = "#7fdbca",
  teal = "#21c7a8",
  white = "#ffffff",
}

-- ─── Editor UI ────────────────────────────────────────────────────────────────
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_lighter })
hi("NormalNC", { fg = c.fg, bg = c.bg_dark })
hi("SignColumn", { fg = c.fg_dark, bg = c.bg })
hi("ColorColumn", { bg = c.bg_highlight })
hi("CursorLine", { bg = c.bg_highlight })
hi("CursorColumn", { bg = c.bg_highlight })
hi("CursorLineNr", { fg = c.yellow, bold = true })
hi("LineNr", { fg = c.fg_dark })
hi("Visual", { bg = c.bg_visual })
hi("VisualNOS", { bg = c.bg_visual })
hi("MatchParen", { fg = c.white, bg = c.bg_visual, bold = true })
hi("StatusLine", { fg = c.fg, bg = c.bg_dark })
hi("StatusLineNC", { fg = c.fg_dim, bg = c.bg_dark })
hi("TabLine", { fg = c.fg_dim, bg = c.bg_dark })
hi("TabLineSel", { fg = c.fg, bg = c.bg })
hi("TabLineFill", { bg = c.bg_dark })
hi("WinSeparator", { fg = c.border })
hi("VertSplit", { fg = c.border })
hi("Folded", { fg = c.fg_dim, bg = c.bg_highlight })
hi("FoldColumn", { fg = c.fg_dark, bg = c.bg })
hi("Search", { fg = c.bg_dark, bg = c.yellow })
hi("IncSearch", { fg = c.bg_dark, bg = c.orange })
hi("Substitute", { fg = c.bg_dark, bg = c.red })
hi("WildMenu", { fg = c.bg_dark, bg = c.blue })
hi("Pmenu", { fg = c.fg, bg = c.bg_lighter })
hi("PmenuSel", { fg = c.bg_dark, bg = c.blue })
hi("PmenuSbar", { bg = c.bg_lighter })
hi("PmenuThumb", { bg = c.border })
hi("FloatBorder", { fg = c.border, bg = c.bg_lighter })
hi("Title", { fg = c.blue, bold = true })
hi("Directory", { fg = c.teal })
hi("Question", { fg = c.green })
hi("MoreMsg", { fg = c.green })
hi("ModeMsg", { fg = c.fg })
hi("ErrorMsg", { fg = c.red })
hi("WarningMsg", { fg = c.yellow })
hi("NonText", { fg = c.fg_dark })
hi("SpecialKey", { fg = c.fg_dark })
hi("Whitespace", { fg = c.bg_highlight })
hi("EndOfBuffer", { fg = c.bg })
hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.yellow, undercurl = true })
hi("SpellRare", { sp = c.magenta, undercurl = true })
hi("SpellLocal", { sp = c.sky, undercurl = true })

-- ─── Syntax ───────────────────────────────────────────────────────────────────
hi("Comment", { fg = c.fg_dim, italic = true })
hi("Constant", { fg = c.orange })
hi("String", { fg = c.green_light })
hi("Character", { fg = c.green })
hi("Number", { fg = c.orange })
hi("Boolean", { fg = c.orange, italic = true })
hi("Float", { fg = c.orange })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.blue })
hi("Statement", { fg = c.magenta })
hi("Conditional", { fg = c.magenta, italic = true })
hi("Repeat", { fg = c.magenta, italic = true })
hi("Label", { fg = c.magenta })
hi("Operator", { fg = c.sky })
hi("Keyword", { fg = c.magenta, italic = true })
hi("Exception", { fg = c.red })
hi("PreProc", { fg = c.cyan })
hi("Include", { fg = c.cyan })
hi("Define", { fg = c.cyan })
hi("Macro", { fg = c.cyan })
hi("PreCondit", { fg = c.cyan })
hi("Type", { fg = c.cyan })
hi("StorageClass", { fg = c.blue, italic = true })
hi("Structure", { fg = c.cyan })
hi("Typedef", { fg = c.cyan })
hi("Special", { fg = c.yellow })
hi("SpecialChar", { fg = c.yellow })
hi("Tag", { fg = c.red })
hi("Delimiter", { fg = c.sky })
hi("SpecialComment", { fg = c.teal })
hi("Debug", { fg = c.red })
hi("Underlined", { underline = true })
hi("Ignore", { fg = c.fg_dark })
hi("Error", { fg = c.red })
hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.orange, italic = true })
hi("@variable.parameter", { fg = c.fg })
hi("@variable.member", { fg = c.fg })
hi("@constant", { fg = c.orange })
hi("@constant.builtin", { fg = c.orange, italic = true })
hi("@constant.macro", { fg = c.cyan })
hi("@module", { fg = c.cyan })
hi("@string", { fg = c.green_light })
hi("@string.escape", { fg = c.yellow })
hi("@string.special", { fg = c.yellow })
hi("@character", { fg = c.green })
hi("@number", { fg = c.orange })
hi("@boolean", { fg = c.orange, italic = true })
hi("@float", { fg = c.orange })
hi("@function", { fg = c.blue })
hi("@function.builtin", { fg = c.sky })
hi("@function.macro", { fg = c.cyan })
hi("@function.method", { fg = c.blue })
hi("@constructor", { fg = c.cyan })
hi("@operator", { fg = c.sky })
hi("@keyword", { fg = c.magenta, italic = true })
hi("@keyword.function", { fg = c.magenta, italic = true })
hi("@keyword.operator", { fg = c.sky })
hi("@keyword.return", { fg = c.magenta, italic = true })
hi("@keyword.import", { fg = c.cyan })
hi("@conditional", { fg = c.magenta, italic = true })
hi("@repeat", { fg = c.magenta, italic = true })
hi("@exception", { fg = c.red })
hi("@type", { fg = c.cyan })
hi("@type.builtin", { fg = c.cyan, italic = true })
hi("@type.qualifier", { fg = c.blue, italic = true })
hi("@property", { fg = c.fg })
hi("@attribute", { fg = c.yellow })
hi("@punctuation", { fg = c.fg })
hi("@punctuation.bracket", { fg = c.fg })
hi("@punctuation.delimiter", { fg = c.sky })
hi("@tag", { fg = c.red })
hi("@tag.attribute", { fg = c.yellow })
hi("@tag.delimiter", { fg = c.fg_dim })
hi("@comment", { fg = c.fg_dim, italic = true })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.sky })
hi("DiagnosticHint", { fg = c.teal })
hi("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.sky, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.teal, undercurl = true })
hi("LspReferenceText", { bg = c.bg_visual })
hi("LspReferenceRead", { bg = c.bg_visual })
hi("LspReferenceWrite", { bg = c.bg_visual })
hi("LspSignatureActiveParameter", { fg = c.yellow, bold = true })

-- ─── Git ──────────────────────────────────────────────────────────────────────
hi("DiffAdd", { bg = "#1e3a1e" })
hi("DiffChange", { bg = "#1e2a3a" })
hi("DiffDelete", { fg = c.red, bg = "#3a1e1e" })
hi("DiffText", { bg = "#1e3550" })
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.blue })
hi("GitSignsDelete", { fg = c.red })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeBorder", { fg = c.border, bg = c.bg_lighter })
hi("TelescopeNormal", { fg = c.fg, bg = c.bg_lighter })
hi("TelescopeSelection", { fg = c.fg, bg = c.bg_visual })
hi("TelescopeSelectionCaret", { fg = c.blue })
hi("TelescopeMatching", { fg = c.yellow, bold = true })
hi("TelescopePromptPrefix", { fg = c.blue })

-- ─── nvim-tree / neo-tree ─────────────────────────────────────────────────────
hi("NvimTreeNormal", { fg = c.fg, bg = c.bg_dark })
hi("NvimTreeFolderIcon", { fg = c.teal })
hi("NvimTreeGitNew", { fg = c.green })
hi("NvimTreeGitDirty", { fg = c.yellow })
hi("NvimTreeGitDeleted", { fg = c.red })

-- ─── Indent guides ────────────────────────────────────────────────────────────
hi("IndentBlanklineChar", { fg = c.border })
hi("IndentBlanklineContextChar", { fg = c.fg_dim })

-- ─── Misc plugins ─────────────────────────────────────────────────────────────
hi("WhichKeyBorder", { fg = c.border, bg = c.bg_lighter })
hi("NotifyBackground", { bg = c.bg })
hi("IlluminatedWordText", { bg = c.bg_visual })
hi("IlluminatedWordRead", { bg = c.bg_visual })
hi("IlluminatedWordWrite", { bg = c.bg_visual })
