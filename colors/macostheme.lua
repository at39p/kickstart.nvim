-- macOS Classic Light Theme for Neovim
-- Accurate port of the Zed macOS Classic Light theme
-- Place this file in ~/.config/nvim/colors/macos-classic-light.lua

local M = {}

-- Reset highlighting
vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.termguicolors = true
vim.g.colors_name = 'macostheme'

-- Color palette based on Zed macOS Classic Light
local colors = {
  -- Base colors
  bg = '#ffffff',
  bg_secondary = '#f9f9f9',
  bg_tertiary = '#f7f7f7',
  fg = '#000000',
  fg_secondary = '#333333',
  fg_tertiary = '#666666',

  -- UI colors
  border = '#d2d2d2',
  border_variant = '#e0e0e0',
  selection = '#c6deff',
  selection_inactive = '#e4e4e4',
  cursor_line = '#f5f5f5',
  search_bg = '#ffe6bb',
  inc_search = '#ffce77',

  -- Syntax colors (from Zed macOS Classic)
  keyword = '#0000a2', -- Dark blue for keywords (pub, const, fn, var, if, return)
  type_color = '#6e79f1', -- Purple for types and type names
  property = '#c5060b', -- Red for properties, fields, enum members
  string = '#036a07', -- Dark green for strings
  number = '#0000cd', -- Blue for numbers
  comment = '#0066ff', -- Light blue for comments
  constant = '#c5060b', -- Red for constants (uppercase)
  function_call = '#000000', -- Black for function calls
  namespace = '#000000', -- Black for namespaces
  operator = '#000000', -- Black for operators

  -- Additional colors
  error = '#990000',
  warning = '#ff8c00',
  info = '#4169e1',
  hint = '#808080',

  -- Git colors
  git_add = '#22863a',
  git_change = '#e36209',
  git_delete = '#d73a49',
}

-- Highlight groups
local highlights = {
  -- Editor highlights
  Normal = { fg = colors.fg, bg = colors.bg },
  NormalFloat = { fg = colors.fg, bg = colors.bg_secondary },
  FloatBorder = { fg = colors.border },
  ColorColumn = { bg = colors.bg_tertiary },
  Conceal = { fg = colors.fg_tertiary },
  Cursor = { fg = colors.bg, bg = colors.fg },
  CursorIM = { fg = colors.bg, bg = colors.fg },
  CursorColumn = { bg = colors.cursor_line },
  CursorLine = { bg = colors.cursor_line },
  CursorLineNr = { fg = colors.fg_secondary, bold = true },
  LineNr = { fg = colors.fg_tertiary },
  Directory = { fg = colors.keyword },
  DiffAdd = { bg = '#e6ffed' },
  DiffChange = { bg = '#fff5b1' },
  DiffDelete = { bg = '#ffeef0' },
  DiffText = { bg = '#ffd33d', bold = true },
  EndOfBuffer = { fg = colors.bg },
  ErrorMsg = { fg = colors.error },
  VertSplit = { fg = colors.border },
  WinSeparator = { fg = colors.border },
  Folded = { fg = colors.comment, bg = colors.bg_tertiary },
  FoldColumn = { fg = colors.fg_tertiary, bg = colors.bg },
  SignColumn = { fg = colors.fg_tertiary, bg = colors.bg },
  IncSearch = { bg = colors.inc_search },
  Search = { bg = colors.search_bg },
  Substitute = { fg = colors.bg, bg = colors.property },
  MatchParen = { bg = colors.selection, bold = true },
  ModeMsg = { fg = colors.fg_secondary },
  MsgArea = { fg = colors.fg },
  MsgSeparator = { fg = colors.border },
  MoreMsg = { fg = colors.string },
  NonText = { fg = colors.fg_tertiary },
  Pmenu = { fg = colors.fg, bg = colors.bg_secondary },
  PmenuSel = { fg = colors.fg, bg = colors.selection },
  PmenuSbar = { bg = colors.bg_tertiary },
  PmenuThumb = { bg = colors.border },
  Question = { fg = colors.keyword },
  QuickFixLine = { bg = colors.selection },
  SpecialKey = { fg = colors.fg_tertiary },
  SpellBad = { undercurl = true, sp = colors.error },
  SpellCap = { undercurl = true, sp = colors.warning },
  SpellLocal = { undercurl = true, sp = colors.info },
  SpellRare = { undercurl = true, sp = colors.hint },
  StatusLine = { fg = colors.fg_secondary, bg = colors.bg_tertiary },
  StatusLineNC = { fg = colors.fg_tertiary, bg = colors.bg_secondary },
  TabLine = { fg = colors.fg_tertiary, bg = colors.bg_secondary },
  TabLineFill = { bg = colors.bg_secondary },
  TabLineSel = { fg = colors.fg, bg = colors.bg, bold = true },
  Title = { fg = colors.keyword, bold = true },
  Visual = { bg = colors.selection },
  VisualNOS = { bg = colors.selection_inactive },
  WarningMsg = { fg = colors.warning },
  Whitespace = { fg = colors.fg_tertiary },
  WildMenu = { fg = colors.fg, bg = colors.selection },

  -- Syntax highlights
  Comment = { fg = colors.comment, italic = true },
  Constant = { fg = colors.type_color }, -- null, true, false
  String = { fg = colors.string },
  Character = { fg = colors.string },
  Number = { fg = colors.number },
  Boolean = { fg = colors.type_color }, -- true/false like null
  Float = { fg = colors.number },
  Identifier = { fg = colors.property }, -- Variable names, field names
  Function = { fg = colors.function_call }, -- Function names in definitions and calls
  Statement = { fg = colors.keyword }, -- Keywords
  Conditional = { fg = colors.keyword }, -- if, else
  Repeat = { fg = colors.keyword }, -- for, while
  Label = { fg = colors.property },
  Operator = { fg = colors.operator },
  Keyword = { fg = colors.keyword },
  Exception = { fg = colors.keyword },
  PreProc = { fg = colors.keyword },
  Include = { fg = colors.keyword },
  Define = { fg = colors.keyword },
  Macro = { fg = colors.constant },
  PreCondit = { fg = colors.keyword },
  Type = { fg = colors.type_color }, -- Type names
  StorageClass = { fg = colors.keyword }, -- const, var, pub
  Structure = { fg = colors.keyword }, -- struct, enum
  Typedef = { fg = colors.type_color },
  Special = { fg = colors.fg },
  SpecialChar = { fg = colors.string },
  Tag = { fg = colors.keyword },
  Delimiter = { fg = colors.fg },
  SpecialComment = { fg = colors.comment, italic = true },
  Debug = { fg = colors.property },
  Underlined = { underline = true },
  Ignore = { fg = colors.fg_tertiary },
  Error = { fg = colors.error },
  Todo = { fg = colors.comment, bold = true, italic = true },

  -- LSP highlights
  LspReferenceText = { bg = colors.selection_inactive },
  LspReferenceRead = { bg = colors.selection_inactive },
  LspReferenceWrite = { bg = colors.selection_inactive },
  LspCodeLens = { fg = colors.fg_tertiary },
  LspCodeLensSeparator = { fg = colors.fg_tertiary },
  LspSignatureActiveParameter = { bg = colors.selection },

  -- Diagnostic highlights
  DiagnosticError = { fg = colors.error },
  DiagnosticWarn = { fg = colors.warning },
  DiagnosticInfo = { fg = colors.info },
  DiagnosticHint = { fg = colors.hint },
  DiagnosticVirtualTextError = { fg = colors.error },
  DiagnosticVirtualTextWarn = { fg = colors.warning },
  DiagnosticVirtualTextInfo = { fg = colors.info },
  DiagnosticVirtualTextHint = { fg = colors.hint },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
  DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

  -- TreeSitter highlights for accurate syntax
  ['@annotation'] = { fg = colors.keyword },
  ['@attribute'] = { fg = colors.keyword },
  ['@boolean'] = { fg = colors.type_color }, -- true/false like types
  ['@character'] = { fg = colors.string },
  ['@character.special'] = { fg = colors.string },
  ['@comment'] = { fg = colors.comment, italic = true },
  ['@conditional'] = { fg = colors.keyword },
  ['@constant'] = { fg = colors.constant }, -- UPPERCASE constants
  ['@constant.builtin'] = { fg = colors.type_color }, -- null, undefined
  ['@constant.macro'] = { fg = colors.constant },
  ['@constructor'] = { fg = colors.type_color },
  ['@debug'] = { fg = colors.property },
  ['@define'] = { fg = colors.keyword },
  ['@error'] = { fg = colors.error },
  ['@exception'] = { fg = colors.keyword },
  ['@field'] = { fg = colors.property }, -- Field names
  ['@float'] = { fg = colors.number },
  ['@function'] = { fg = colors.function_call },
  ['@function.builtin'] = { fg = colors.function_call },
  ['@function.call'] = { fg = colors.function_call },
  ['@function.macro'] = { fg = colors.keyword },
  ['@function.method'] = { fg = colors.function_call },
  ['@function.method.call'] = { fg = colors.function_call },
  ['@include'] = { fg = colors.keyword },
  ['@keyword'] = { fg = colors.keyword },
  ['@keyword.coroutine'] = { fg = colors.keyword },
  ['@keyword.function'] = { fg = colors.keyword }, -- fn
  ['@keyword.operator'] = { fg = colors.keyword },
  ['@keyword.return'] = { fg = colors.keyword },
  ['@keyword.storage'] = { fg = colors.keyword }, -- const, pub, var
  ['@label'] = { fg = colors.property },
  ['@method'] = { fg = colors.function_call },
  ['@method.call'] = { fg = colors.function_call },
  ['@namespace'] = { fg = colors.namespace },
  ['@none'] = { fg = colors.fg },
  ['@number'] = { fg = colors.number },
  ['@operator'] = { fg = colors.operator },
  ['@parameter'] = { fg = colors.property },
  ['@parameter.reference'] = { fg = colors.property },
  ['@preproc'] = { fg = colors.keyword },
  ['@property'] = { fg = colors.property },
  ['@punctuation.bracket'] = { fg = colors.fg },
  ['@punctuation.delimiter'] = { fg = colors.fg },
  ['@punctuation.special'] = { fg = colors.fg },
  ['@repeat'] = { fg = colors.keyword },
  ['@storageclass'] = { fg = colors.keyword },
  ['@string'] = { fg = colors.string },
  ['@string.escape'] = { fg = colors.string },
  ['@string.regex'] = { fg = colors.string },
  ['@string.special'] = { fg = colors.string },
  ['@symbol'] = { fg = colors.property },
  ['@tag'] = { fg = colors.keyword },
  ['@tag.attribute'] = { fg = colors.property },
  ['@tag.delimiter'] = { fg = colors.fg },
  ['@text'] = { fg = colors.fg },
  ['@text.danger'] = { fg = colors.error },
  ['@text.emphasis'] = { italic = true },
  ['@text.literal'] = { fg = colors.string },
  ['@text.note'] = { fg = colors.info },
  ['@text.reference'] = { underline = true },
  ['@text.strike'] = { strikethrough = true },
  ['@text.strong'] = { bold = true },
  ['@text.title'] = { fg = colors.keyword, bold = true },
  ['@text.todo'] = { fg = colors.comment, bold = true, italic = true },
  ['@text.underline'] = { underline = true },
  ['@text.uri'] = { fg = colors.keyword, underline = true },
  ['@text.warning'] = { fg = colors.warning },
  ['@todo'] = { fg = colors.comment, bold = true, italic = true },
  ['@type'] = { fg = colors.type_color },
  ['@type.builtin'] = { fg = colors.type_color },
  ['@type.definition'] = { fg = colors.type_color },
  ['@type.qualifier'] = { fg = colors.keyword },
  ['@variable'] = { fg = colors.property }, -- Variable names
  ['@variable.builtin'] = { fg = colors.property },
  ['@variable.member'] = { fg = colors.property }, -- Struct fields
  ['@variable.parameter'] = { fg = colors.property },

  -- Language-specific highlights
  -- Zig
  ['@type.zig'] = { fg = colors.type_color },
  ['@constant.zig'] = { fg = colors.constant },
  ['@field.zig'] = { fg = colors.property },
  ['@property.zig'] = { fg = colors.property },
  ['@variable.member.zig'] = { fg = colors.property },

  -- Rust
  ['@type.rust'] = { fg = colors.type_color },
  ['@constant.rust'] = { fg = colors.constant },
  ['@field.rust'] = { fg = colors.property },
  ['@property.rust'] = { fg = colors.property },

  -- TypeScript/JavaScript
  ['@type.typescript'] = { fg = colors.type_color },
  ['@type.javascript'] = { fg = colors.type_color },
  ['@constructor.javascript'] = { fg = colors.type_color },
  ['@constructor.typescript'] = { fg = colors.type_color },
  ['@constant.javascript'] = { fg = colors.constant },
  ['@constant.typescript'] = { fg = colors.constant },

  -- Python
  ['@type.python'] = { fg = colors.type_color },
  ['@constant.python'] = { fg = colors.constant },
  ['@field.python'] = { fg = colors.property },

  -- Go
  ['@type.go'] = { fg = colors.type_color },
  ['@constant.go'] = { fg = colors.constant },
  ['@field.go'] = { fg = colors.property },

  -- C/C++
  ['@type.c'] = { fg = colors.type_color },
  ['@type.cpp'] = { fg = colors.type_color },
  ['@constant.c'] = { fg = colors.constant },
  ['@constant.cpp'] = { fg = colors.constant },
  ['@field.c'] = { fg = colors.property },
  ['@field.cpp'] = { fg = colors.property },

  -- Git signs
  GitSignsAdd = { fg = colors.git_add },
  GitSignsChange = { fg = colors.git_change },
  GitSignsDelete = { fg = colors.git_delete },
  GitSignsAddNr = { fg = colors.git_add },
  GitSignsChangeNr = { fg = colors.git_change },
  GitSignsDeleteNr = { fg = colors.git_delete },
  GitSignsAddLn = { bg = '#e6ffed' },
  GitSignsChangeLn = { bg = '#fff5b1' },
  GitSignsDeleteLn = { bg = '#ffeef0' },

  -- Telescope
  TelescopeNormal = { fg = colors.fg, bg = colors.bg },
  TelescopeBorder = { fg = colors.border },
  TelescopePromptBorder = { fg = colors.border },
  TelescopeResultsBorder = { fg = colors.border },
  TelescopePreviewBorder = { fg = colors.border },
  TelescopeSelection = { bg = colors.selection },
  TelescopeSelectionCaret = { fg = colors.keyword },
  TelescopeMultiSelection = { bg = colors.selection_inactive },
  TelescopeMatching = { fg = colors.keyword, bold = true },

  -- NvimTree
  NvimTreeNormal = { fg = colors.fg, bg = colors.bg },
  NvimTreeRootFolder = { fg = colors.keyword, bold = true },
  NvimTreeFolderIcon = { fg = colors.keyword },
  NvimTreeFolderName = { fg = colors.fg },
  NvimTreeOpenedFolderName = { fg = colors.keyword },
  NvimTreeEmptyFolderName = { fg = colors.fg_tertiary },
  NvimTreeFileDirty = { fg = colors.git_change },
  NvimTreeGitDirty = { fg = colors.git_change },
  NvimTreeGitNew = { fg = colors.git_add },
  NvimTreeGitDeleted = { fg = colors.git_delete },
  NvimTreeSpecialFile = { fg = colors.type_color },
  NvimTreeIndentMarker = { fg = colors.border },
  NvimTreeImageFile = { fg = colors.property },
  NvimTreeSymlink = { fg = colors.keyword },
  NvimTreeExecFile = { fg = colors.string },

  -- Indent Blankline
  IndentBlanklineChar = { fg = colors.border },
  IndentBlanklineContextChar = { fg = colors.border_variant },

  -- Leap.nvim
  LeapMatch = { fg = colors.bg, bg = colors.keyword, bold = true },
  LeapLabelPrimary = { fg = colors.bg, bg = colors.property, bold = true },
  LeapLabelSecondary = { fg = colors.bg, bg = colors.type_color, bold = true },

  -- Cmp
  CmpItemAbbrMatch = { fg = colors.keyword, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = colors.keyword, bold = true },
  CmpItemKindText = { fg = colors.string },
  CmpItemKindMethod = { fg = colors.function_call },
  CmpItemKindFunction = { fg = colors.function_call },
  CmpItemKindConstructor = { fg = colors.type_color },
  CmpItemKindField = { fg = colors.property },
  CmpItemKindVariable = { fg = colors.property },
  CmpItemKindClass = { fg = colors.type_color },
  CmpItemKindInterface = { fg = colors.type_color },
  CmpItemKindModule = { fg = colors.namespace },
  CmpItemKindProperty = { fg = colors.property },
  CmpItemKindUnit = { fg = colors.number },
  CmpItemKindValue = { fg = colors.number },
  CmpItemKindEnum = { fg = colors.type_color },
  CmpItemKindKeyword = { fg = colors.keyword },
  CmpItemKindSnippet = { fg = colors.string },
  CmpItemKindColor = { fg = colors.property },
  CmpItemKindFile = { fg = colors.fg },
  CmpItemKindReference = { fg = colors.property },
  CmpItemKindFolder = { fg = colors.keyword },
  CmpItemKindEnumMember = { fg = colors.property },
  CmpItemKindConstant = { fg = colors.constant },
  CmpItemKindStruct = { fg = colors.type_color },
  CmpItemKindEvent = { fg = colors.property },
  CmpItemKindOperator = { fg = colors.operator },
  CmpItemKindTypeParameter = { fg = colors.type_color },
}

-- Apply highlights
for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

return M
