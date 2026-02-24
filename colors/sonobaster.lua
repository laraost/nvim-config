--[[
Sonokai colors transplanted onto dark-mode alabaster.nvim

================================================================================
alabaster.nvim: (https://github.com/p00f/alabaster.nvim)

MIT License

Copyright (c) 2021-2022 Chinmay Dalal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

================================================================================
sonokai: (https://github.com/sainnhe/sonokai)

MIT License

Copyright (c) 2020 sainnhe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]]

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "sonobaster"

local theme
-- terminal colors
vim.g.terminal_color_0 = "#000000"
vim.g.terminal_color_1 = "#fc5d7c"
vim.g.terminal_color_2 = "#9ed072"
vim.g.terminal_color_3 = "#e7c664"
vim.g.terminal_color_4 = "#217EBC"
vim.g.terminal_color_5 = "#9B3596"
vim.g.terminal_color_6 = "#178F79"
vim.g.terminal_color_7 = "#e2e2e3"
vim.g.terminal_color_8 = "#333333"
vim.g.terminal_color_9 = "#fc5d7c"
vim.g.terminal_color_10 = "#a7df78"
vim.g.terminal_color_11 = "#b39df3"
vim.g.terminal_color_12 = "#71aed7"
vim.g.terminal_color_13 = "#85d3f2"
vim.g.terminal_color_14 = "#47BEA9"
vim.g.terminal_color_15 = "#ffffff"

-- colors
local bg = "#2c2e34"
local fg = "#e2e2e3"
local punct_fg = "#afb5c1"
local def_fg = "#71ade7"
local const_fg = "#85d3f2"
local active = "#e7c664"
local string_fg = "#a7df78"
local darker_fg = "#7f8490"
local diffadd = "#9ed072"
local diffdelete = "#fc5d7c"
local diffchange = "#f39660"
local statusline = "#363944"
local comment = "#b39df3"
local dim_comment = "#595f6f"
local mistake = {
  fg = "#fc5d7c",
  bg = "#2c2e34",
}
local error = "#fc5d7c"
local warn = "#f39660"
local hint = "#85d3f2"
local info = "#a7df78"
local ansi = {
  black = "#333333",
  blue = "#71aed7",
  brightyellow = "#e7c664",
  cyan = "#85d3f2",
  green = "#a7df78",
  magenta = "#ff6077",
  red = "#fc5d7c",
  white = "#e2e2e3",
  yellow = "#e7c664",
}
local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
local pmenu_bg = "#182325"
local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#333333" }
  or {
      bg = float_bg,
      fg = float_bg,
  }
theme = {
  Comment = { fg = comment_fg },
  ColorColumn = { bg = "#182325" },
  Conceal = { fg = "#b0b0b0" },
  Cursor = { bg = active, fg = "#000000" },
  -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
  -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
  CursorColumn = { bg = "#182325" },
  CursorLine = { bg = "#182325" },
  Directory = { fg = ansi.blue },
  DiffAdd = { bg = "#244032", fg = "#56d364" },
  DiffDelete = { bg = "#462c32", fg = "#f85149" },
  DiffText = { fg = "#341a00", bg = "#fff987" },
  DiffChange = { bg = "#341a00", fg = "#e3b341" },
  EndOfBuffer = { fg = "#354c50" },
  -- TermCursor   { }, -- cursor in a focused terminal
  TermCursorNC = { fg = bg, bg = fg },
  ErrorMsg = { fg = error, bg = mistake.bg },
  VertSplit = { fg = "#2b3d40" },
  Folded = { bg = "#182325", fg = "#7f8490" },
  FoldColumn = { bg = bg, fg = "#4d4d4d" },
  SignColumn = {},
  IncSearch = { bg = ansi.yellow, fg = bg },
  -- Substitute   { }, -- |:substitute| replacement text highlighting
  LineNr = { fg = "#9c9c9c" },
  CursorLineNr = { fg = ansi.blue, bold = 1 },
  MatchParen = { underline = 1, sp = active },
  -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
  -- MsgArea      { }, -- Area for messages and cmdline
  -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
  MoreMsg = { fg = ansi.green, bold = 1 },
  NonText = { fg = "#595f6f" },
  Normal = { bg = bg, fg = fg },
  NormalFloat = { bg = float_bg },
  -- NormalNC     { }, -- normal text in non-current windows
  FloatBorder = floatborder,
  Pmenu = { bg = pmenu_bg },
  PmenuSel = { bg = "#354c50" },
  PmenuSbar = { bg = "#212f31" },
  PmenuThumb = { bg = "#47666b" },
  Question = { fg = diffadd },
  QuickFixLine = { bg = "#182325" },
  Search = { bg = "#354c50" },
  SpecialKey = { fg = ansi.cyan },
  SpellBad = { undercurl = 1, sp = ansi.red },
  SpellCap = { undercurl = 1, sp = ansi.blue },
  SpellLocal = { undercurl = 1, sp = ansi.cyan },
  SpellRare = { undercurl = 1, sp = ansi.magenta },
  StatusLine = { bg = statusline, fg = fg },
  StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
  TabLine = { bg = statusline, fg = "#7f8490" },
  TabLineFill = { bg = statusline },
  TabLineSel = { bg = statusline, fg = ansi.blue },
  Title = { fg = const_fg },
  Visual = { bg = "#394634"},
  VisualNOS = { bg = "#394634" },
  WarningMsg = { fg = "#e1ad4c" },
  WildMenu = { bg = "#354c50" },
  WinBar = { bg = bg, fg = ansi.white, bold = true },
  WinBarNC = { bg = bg, fg = "#7f8490" },

  --- SYNTAX I: TS groups link to these
  Constant = { fg = const_fg },
  String = { fg = string_fg },
  Character = { fg = const_fg },
  Number = { fg = const_fg },
  Boolean = { fg = const_fg },
  Float = { fg = const_fg },
  Operator = { fg = punct_fg },

  --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
  Identifier = { fg = ansi.white },
  Function = { fg = def_fg },
  Statement = { fg = ansi.white },
  Conditional = { fg = ansi.white },
  Repeat = { fg = ansi.white },
  Label = { fg = def_fg },
  Keyword = { fg = ansi.white },
  Exception = { fg = ansi.white },
  PreProc = { fg = ansi.white },
  Include = { fg = ansi.white },
  Define = { fg = ansi.white },
  Macro = { fg = ansi.white },
  PreCondit = { fg = ansi.white },
  Type = { fg = ansi.white },
  StorageClass = { fg = ansi.white },
  Structure = { fg = def_fg },
  Typedef = { fg = def_fg },

  Special = { fg = ansi.yellow },
  -- TODO better color than diffchange, try reddish
  -- SpecialChar = { fg = diffchange }, --  special character in a constant
  -- Tag            { }, --    you can use CTRL-] on this
  -- Delimiter      { },
  SpecialComment = { bg = "#1d292b", fg = ansi.blue },
  debugPc = { bg = "#0f2534" },
  debugBreakpoint = { bg = "#b33229" },
  helpHyperTextJump = { fg = ansi.magenta },
  helpSectionDelim = { fg = ansi.magenta },
  helpExample = { fg = ansi.cyan },
  helpCommand = { fg = ansi.cyan },
  helpHeadline = { fg = ansi.blue },
  helpHeader = { fg = ansi.magenta },

  Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
  Italic = { italic = 1 },

  -- ("Ignore", below, may be invisible...)
  -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

  Error = { bg = mistake.bg, fg = mistake.fg },

  Todo = { bg = "#d0d058", fg = bg },

  --- Diagnostic
  LspReferenceText = { bg = "#253437" },
  LspReferenceRead = { bg = "#253437" },
  LspReferenceWrite = { bg = "#253437", underline = 1, sp = active },
  LspCodeLens = { fg = "#5c5c5c" },
  LspCodeLensSeparator = { fg = "#5c5c5c" },

  --- Diagnostic
  DiagnosticError = { fg = error },
  DiagnosticWarn = { fg = warn },
  DiagnosticHint = { fg = hint },
  DiagnosticInfo = { fg = info },
  DiagnosticVirtualTextError = { bg = "#350B0B", fg = "#D1503A" },
  DiagnosticVirtualTextWarn = { bg = "#3F240A", fg = "#C8935D" },
  DiagnosticVirtualTextHint = { bg = "#1D2B37", fg = "#7E9CB9" },
  DiagnosticVirtualTextInfo = { bg = "#162C0B", fg = "#7BAC62" },

  --- Treesitter
  TSAttribute = {},
  TSConstructor = { fg = ansi.white },
  TSConditional = { fg = ansi.white },
  TSConstBuiltin = { fg = const_fg },
  TSConstMacro = { fg = ansi.white },
  TSError = { bg = mistake.bg, fg = mistake.fg },
  TSException = { fg = ansi.white },
  TSField = { fg = ansi.white },
  TSFunction = { fg = ansi.white },
  TSFuncBuiltin = { fg = ansi.white },
  TSFuncMacro = { fg = ansi.white },
  TSKeyword = { fg = ansi.white },
  TSKeywordFunction = { fg = ansi.white },
  TSLabel = { fg = ansi.white },
  TSMethod = { fg = ansi.white },
  TSNamespace = { fg = ansi.white },
  TSNone = { fg = const_fg },
  TSParameter = { fg = ansi.white },
  TSParameterReference = { fg = ansi.white },
  TSProperty = { fg = ansi.white },
  TSPunctDelimiter = { fg = punct_fg },
  TSPunctBracket = { fg = "#bababa" },
  TSPunctSpecial = { fg = punct_fg },
  TSRepeat = { fg = ansi.white },
  TSString = { fg = string_fg },
  TSStringRegex = { bg = "#1d292b", fg = const_fg },
  TSStringEscape = { bg = "#1d292b", fg = const_fg },
  TSSymbol = {},
  TSType = { fg = ansi.white },
  TSTypeBuiltin = { fg = ansi.white },
  TSVariable = { fg = ansi.white },
  TSVariableBuiltin = { fg = ansi.white },
  TSTag = { fg = ansi.white },
  TSTagDelimiter = { fg = punct_fg },
  TSText = { fg = ansi.white },
  ["@attribute"] = {},
  ["@constructor"] = { fg = ansi.white },
  ["@conditional"] = { fg = ansi.white },
  ["@constant.builtin"] = { fg = const_fg },
  ["@constant.macro"] = { fg = ansi.white },
  ["@error"] = { bg = mistake.bg, fg = mistake.fg },
  ["@exception"] = { fg = ansi.white },
  ["@field"] = { fg = ansi.white },
  ["@function"] = { fg = ansi.white },
  ["@function.builtin"] = { fg = ansi.white },
  ["@function.macro"] = { fg = ansi.white },
  ["@keyword"] = { fg = ansi.white },
  ["@keyword.function"] = { fg = ansi.white },
  ["@keyword.operator"] = { fg = punct_fg },
  ["@label"] = { fg = ansi.white },
  ["@method"] = { fg = ansi.white },
  ["@module"] = { fg = ansi.white },
  ["@namespace"] = { fg = ansi.white },
  ["@none"] = { fg = const_fg },
  ["@parameter"] = { fg = ansi.white },
  ["@parameter.reference"] = { fg = ansi.white },
  ["@property"] = { fg = ansi.white },
  ["@punctuation.delimiter"] = { fg = punct_fg },
  ["@punctuation.bracket"] = { fg = "#bababa" },
  ["@punctuation.special"] = { fg = punct_fg },
  ["@repeat"] = { fg = ansi.white },
  ["@string"] = { fg = string_fg },
  ["@string.regex"] = { bg = "#1d292b", fg = const_fg },
  ["@string.escape"] = { bg = "#1d292b", fg = const_fg },
  ["@symbol"] = {},
  ["@type"] = { fg = ansi.white },
  ["@type.builtin"] = { fg = ansi.white },
  ["@variable"] = { fg = ansi.white },
  ["@variable.builtin"] = { fg = ansi.white },
  ["@tag"] = { fg = ansi.white },
  ["@tag.delimiter"] = { fg = punct_fg },
  ["@text"] = { fg = ansi.white },
  ["@text.note"] = { bg = "#1d292b", fg = ansi.blue },
  ["@text.warning"] = { bg = "#d0d058", fg = bg },

  --- Theme specific
  ["@AlabasterBase"] = { fg = ansi.white },
  ["@AlabasterConstant"] = { fg = const_fg },
  ["@AlabasterDefinition"] = { fg = def_fg },
  ["@AlabasterPunct"] = { fg = punct_fg },
  ["@AlabasterString"] = { fg = string_fg },
  ["@AlabasterHashbang"] = { fg = dim_comment },
  --- Gitsigns
  GitSignsAdd = { fg = diffadd },
  GitSignsChange = { fg = diffchange },
  GitSignsDelete = { fg = diffdelete },
  --- Telescope
  TelescopeBorder = { fg = "#2b3d40" },
  TelescopeMatching = { fg = "#f09942" },
  TelescopeMultiSelection = { fg = ansi.magenta },
  TelescopePromptPrefix = { fg = ansi.blue },
  TelescopeSelectionCaret = { fg = mistake.fg },
  TelescopeTitle = { fg = ansi.brightyellow },
  TelescopeResultsTitle = { fg = ansi.yellow },
  --- fzf-lua
  FzfLuaBorder = { fg = "#2b3d40" },
  --- mini.nvim
  MiniPickMatchCurrent  = { fg = "#f09942" },
  --- Neogit
  NeogitPopupActionDisabled = { fg = darker_fg },
  NeogitPopupActionKey = { fg = ansi.magenta },
  NeogitPopupOptionDisabled = { fg = darker_fg },
  NeogitPopupOptionKey = { fg = ansi.blue },
  NeogitPopupSwitchDisabled = { fg = darker_fg },
  NeogitPopupSwitchEnabled = { fg = ansi.cyan },
  NeogitPopupSwitchKey = { fg = ansi.magenta },
  --- Fugitive
  diffAdded = { link = "DiffAdd" },
  diffRemoved = { link = "DiffDelete" },
  --- Startify
  StartifyBracket = { fg = darker_fg },
  StartifyFile = { fg = ansi.white },
  StartifySection = { fg = ansi.green },
  StartifySlash = { fg = "#4e6e75" },
  StartifyPath = { fg = "#4e6e75" },
  --- Statusline
  StatuslineAdd = { fg = diffadd, bg = statusline },
  StatuslineErr = { fg = error, bg = statusline },
  StatuslineHint = { fg = hint, bg = statusline },
  StatuslineInfo = { fg = info, bg = statusline },
  StatuslineWarn = { fg = warn, bg = statusline },
  StatuslineBlue = { fg = ansi.blue, bg = statusline },
  StatuslineRed = { fg = ansi.red, bg = statusline },
  StatuslineGreen = { fg = ansi.green, bg = statusline },
  StatuslineCyan = { fg = ansi.cyan, bg = statusline },
  StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
  --- ALE
  ALEWarningSign = { fg = warn },
  --- vim-matchup
  MatchupVirtualText = { fg = ansi.yellow },
  --- For `highlight link`
  AlabasterBlack = { fg = ansi.black },
  AlabasterBlue = { fg = ansi.blue },
  AlabasterBrightYellow = { fg = ansi.brightyellow },
  AlabasterCyan = { fg = ansi.cyan },
  AlabasterGreen = { fg = ansi.green },
  AlabasterDarkGreen = { fg = "#9ed072" },
  AlabasterMagenta = { fg = ansi.magenta },
  AlabasterRed = { fg = ansi.red },
  AlabasterWhite = { fg = ansi.white },
  AlabasterYellow = { fg = ansi.yellow },
  --- Hop
  HopNextKey = { fg = ansi.brightyellow },
  HopNextKey1 = { fg = ansi.cyan },
  HopNextKey2 = { fg = "#297567" },
  HopUnmatched = { fg = "#3d3d3d" },
  --- Lightspeed
  LightspeedGreyWash = { fg = "#3d3d3d" },
  --- checkhealth
  healthSuccess = { fg = ansi.green, bg = bg },
  --- cmp
  CmpItemMenuDefault = { fg = ansi.magenta },
  --- nvim-ts-rainbow
  rainbowcol1 = { fg = ansi.yellow },
  rainbowcol2 = { fg = ansi.magenta },
  rainbowcol3 = { fg = ansi.blue },
  rainbowcol4 = { fg = ansi.green },
  rainbowcol5 = { fg = ansi.brightyellow },
  rainbowcol6 = { fg = ansi.red },
  rainbowcol7 = { fg = ansi.cyan },
  --- Iswap
  ISwapSnipe = { bg = ansi.yellow, fg = bg },
  ISwapGrey = { fg = "#3d3d3d" },
  --- vim-dadbod-ui
  dbui_help = { fg = dim_comment },
  dbui_connection_source = { fg = dim_comment },
  --- nvim-dap-virtual-text
  NvimDapVirtualText = { bg = "#1d292b", fg = ansi.cyan },
  --- Noice
  NoiceCmdlineIcon = { link = "AlabasterDarkGreen" },
  NoiceCmdlinePopupBorder = { link = "AlabasterDarkGreen" },
  NoiceConfirmBorder = { link = "AlabasterDarkGreen" },
  NoiceCmdlinePopupBorderCmdline = { link = "AlabasterDarkGreen" },
  NoiceCmdlineIconCmdline = { link = "AlabasterDarkGreen" },
  NoiceCmdlinePopupBorderFilter = { link = "AlabasterDarkGreen" },
  NoiceCmdlineIconFilter = { link = "AlabasterDarkGreen" },
  NoiceCmdlinePopupBorderLua = { link = "AlabasterDarkGreen" },
  NoiceCmdlineIconLua = { link = "AlabasterDarkGreen" },
  NoiceCmdlinePopupBorderSearch = { link = "AlabasterYellow" },
  NoiceCmdlineIconSearch = { link = "AlabasterYellow" },
  -- Languages
  --- asm
  asmDirective = { fg = dim_comment },
  nasmLabel = { link = "@AlabasterDefinition" },

  ["@lsp.mod.declaration"] = { fg = fg },
  ["@lsp.type.enumMember"] = { fg = fg },
  ["@lsp.type.function"] = { fg = fg },
  ["@lsp.type.method"] = { fg = fg },
  ["@lsp.type.selfKeyword"] = { fg = fg },
  ["@lsp.typemod.class.declaration"] = { fg = def_fg },
  ["@lsp.typemod.class.definition"] = { fg = def_fg },
  ["@lsp.typemod.enum.declaration"] = { fg = def_fg },
  ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
  ["@lsp.typemod.function.declaration"] = { fg = def_fg },
  ["@lsp.typemod.function.definition"] = { fg = def_fg },
  ["@lsp.typemod.macro.declaration"] = { fg = def_fg },
  ["@lsp.typemod.method.declaration"] = { fg = def_fg },
  ["@lsp.typemod.selfKeyword"] = { fg = fg },
  ["@lsp.typemod.struct.declaration"] = { fg = def_fg },
  ["@lsp.typemod.type.declaration"] = { fg = def_fg },
}

for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
