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
  keyword = '#0000a2', -- Dark blue for keywords (pub, const, fn, func, var, if, return)
  type_color = '#6e79f1', -- Purple for types and type names
  field = '#c5060b', -- Red for struct fields, enum members, object keys
  string = '#036a07', -- Dark green for strings
  number = '#0000cd', -- Blue for numbers
  comment = '#0066ff', -- Light blue for comments
  constant = '#c5060b', -- Red for constants (uppercase identifiers)
  variable = '#000000', -- Black for variables and parameters
  function_name = '#000000', -- Black for function names and calls
  namespace = '#000000', -- Black for namespaces/packages
  operator = '#000000', -- Black for operators

  -- Additional colors
  error = '#990000',
  warning = '#ff8c00',
  info = '#4169e1',
  hint = '#808080',

  -- Git colors (matching Zed file explorer)
  git_add = '#0000a2', -- Blue for new files (matches keyword blue)
  git_change = '#c57c41', -- Muted orange for modified files
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
  Substitute = { fg = colors.bg, bg = colors.field },
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
  Constant = { fg = colors.type_color }, -- nil, true, false should be purple
  String = { fg = colors.string },
  Character = { fg = colors.string },
  Number = { fg = colors.number },
  Boolean = { fg = colors.type_color }, -- true/false like nil
  Float = { fg = colors.number },
  Identifier = { fg = colors.variable }, -- Regular identifiers should be black
  Function = { fg = colors.function_name }, -- Function names should be black
  Statement = { fg = colors.keyword }, -- Keywords
  Conditional = { fg = colors.keyword }, -- if, else
  Repeat = { fg = colors.keyword }, -- for, while
  Label = { fg = colors.field }, -- Labels can be red
  Operator = { fg = colors.operator },
  Keyword = { fg = colors.keyword },
  Exception = { fg = colors.keyword },
  PreProc = { fg = colors.keyword },
  Include = { fg = colors.keyword },
  Define = { fg = colors.keyword },
  Macro = { fg = colors.constant },
  PreCondit = { fg = colors.keyword },
  Type = { fg = colors.type_color }, -- Type names should be purple
  StorageClass = { fg = colors.keyword }, -- const, var, pub
  Structure = { fg = colors.keyword }, -- struct, enum
  Typedef = { fg = colors.type_color },
  Special = { fg = colors.variable },
  SpecialChar = { fg = colors.string },
  Tag = { fg = colors.keyword },
  Delimiter = { fg = colors.fg },
  SpecialComment = { fg = colors.comment, italic = true },
  Debug = { fg = colors.field },
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
  ['@boolean'] = { fg = colors.type_color }, -- true/false like nil
  ['@character'] = { fg = colors.string },
  ['@character.special'] = { fg = colors.string },
  ['@comment'] = { fg = colors.comment, italic = true },
  ['@conditional'] = { fg = colors.keyword },
  ['@constant'] = { fg = colors.constant }, -- UPPERCASE constants
  ['@constant.builtin'] = { fg = colors.type_color }, -- nil, undefined
  ['@constant.macro'] = { fg = colors.constant },
  ['@constructor'] = { fg = colors.type_color },
  ['@debug'] = { fg = colors.field },
  ['@define'] = { fg = colors.keyword },
  ['@error'] = { fg = colors.error },
  ['@exception'] = { fg = colors.keyword },
  ['@field'] = { fg = colors.field }, -- Struct/object field declarations
  ['@float'] = { fg = colors.number },
  ['@function'] = { fg = colors.function_name },
  ['@function.builtin'] = { fg = colors.function_name },
  ['@function.call'] = { fg = colors.function_name },
  ['@function.macro'] = { fg = colors.keyword },
  ['@function.method'] = { fg = colors.function_name },
  ['@function.method.call'] = { fg = colors.function_name },
  ['@include'] = { fg = colors.keyword },
  ['@keyword'] = { fg = colors.keyword },
  ['@keyword.coroutine'] = { fg = colors.keyword },
  ['@keyword.function'] = { fg = colors.keyword }, -- fn, func
  ['@keyword.operator'] = { fg = colors.keyword },
  ['@keyword.return'] = { fg = colors.keyword },
  ['@keyword.storage'] = { fg = colors.keyword }, -- const, pub, var
  ['@label'] = { fg = colors.field },
  ['@method'] = { fg = colors.function_name },
  ['@method.call'] = { fg = colors.function_name },
  ['@namespace'] = { fg = colors.namespace },
  ['@none'] = { fg = colors.fg },
  ['@number'] = { fg = colors.number },
  ['@operator'] = { fg = colors.operator },
  ['@parameter'] = { fg = colors.variable }, -- Function parameters should be black
  ['@parameter.reference'] = { fg = colors.variable },
  ['@preproc'] = { fg = colors.keyword },
  ['@property'] = { fg = colors.field }, -- Object properties/keys
  ['@punctuation.bracket'] = { fg = colors.fg },
  ['@punctuation.delimiter'] = { fg = colors.fg },
  ['@punctuation.special'] = { fg = colors.fg },
  ['@repeat'] = { fg = colors.keyword },
  ['@storageclass'] = { fg = colors.keyword },
  ['@string'] = { fg = colors.string },
  ['@string.escape'] = { fg = colors.string },
  ['@string.regex'] = { fg = colors.string },
  ['@string.special'] = { fg = colors.string },
  ['@symbol'] = { fg = colors.field },
  ['@tag'] = { fg = colors.keyword },
  ['@tag.attribute'] = { fg = colors.field },
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
  ['@variable'] = { fg = colors.variable }, -- Variables should be black
  ['@variable.builtin'] = { fg = colors.variable },
  ['@variable.member'] = { fg = colors.variable }, -- Member access should be black
  ['@variable.parameter'] = { fg = colors.variable },

  -- Language-specific highlights
  -- Go specific
  ['@field.go'] = { fg = colors.field }, -- Struct field definitions
  ['@property.go'] = { fg = colors.field }, -- Struct literal keys (UserID:, Email:)
  ['@variable.go'] = { fg = colors.variable }, -- Variables should be black
  ['@parameter.go'] = { fg = colors.variable }, -- Parameters should be black
  ['@namespace.go'] = { fg = colors.namespace }, -- Package names (time, jwt)
  ['@type.go'] = { fg = colors.type_color }, -- Types (string, error)
  ['@constant.builtin.go'] = { fg = colors.type_color }, -- nil
  ['@function.go'] = { fg = colors.function_name },
  ['@method.go'] = { fg = colors.function_name },
  ['@method.call.go'] = { fg = colors.function_name },

  -- Zig specific
  ['@type.zig'] = { fg = colors.type_color },
  ['@constant.zig'] = { fg = colors.constant }, -- UPPERCASE constants
  ['@field.zig'] = { fg = colors.field }, -- Enum members
  ['@property.zig'] = { fg = colors.field }, -- Struct fields
  ['@variable.member.zig'] = { fg = colors.field }, -- Enum values like void_pending
  ['@variable.zig'] = { fg = colors.variable },
  ['@parameter.zig'] = { fg = colors.variable },

  -- Rust
  ['@type.rust'] = { fg = colors.type_color },
  ['@constant.rust'] = { fg = colors.constant },
  ['@field.rust'] = { fg = colors.field },
  ['@property.rust'] = { fg = colors.field },
  ['@variable.rust'] = { fg = colors.variable },
  ['@parameter.rust'] = { fg = colors.variable },

  -- TypeScript/JavaScript
  ['@type.typescript'] = { fg = colors.type_color },
  ['@type.javascript'] = { fg = colors.type_color },
  ['@constructor.javascript'] = { fg = colors.type_color },
  ['@constructor.typescript'] = { fg = colors.type_color },
  ['@constant.javascript'] = { fg = colors.constant },
  ['@constant.typescript'] = { fg = colors.constant },
  ['@property.javascript'] = { fg = colors.field },
  ['@property.typescript'] = { fg = colors.field },
  ['@variable.javascript'] = { fg = colors.variable },
  ['@variable.typescript'] = { fg = colors.variable },
  ['@parameter.javascript'] = { fg = colors.variable },
  ['@parameter.typescript'] = { fg = colors.variable },

  -- Python
  ['@type.python'] = { fg = colors.type_color },
  ['@constant.python'] = { fg = colors.constant },
  ['@field.python'] = { fg = colors.field },
  ['@variable.python'] = { fg = colors.variable },
  ['@parameter.python'] = { fg = colors.variable },

  -- C/C++
  ['@type.c'] = { fg = colors.type_color },
  ['@type.cpp'] = { fg = colors.type_color },
  ['@constant.c'] = { fg = colors.constant },
  ['@constant.cpp'] = { fg = colors.constant },
  ['@field.c'] = { fg = colors.field },
  ['@field.cpp'] = { fg = colors.field },
  ['@variable.c'] = { fg = colors.variable },
  ['@variable.cpp'] = { fg = colors.variable },
  ['@parameter.c'] = { fg = colors.variable },
  ['@parameter.cpp'] = { fg = colors.variable },

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
  NvimTreeImageFile = { fg = colors.field },
  NvimTreeSymlink = { fg = colors.keyword },
  NvimTreeExecFile = { fg = colors.string },

  -- Neo-tree
  NeoTreeNormal = { fg = colors.fg, bg = colors.bg },
  NeoTreeNormalNC = { fg = colors.fg, bg = colors.bg },
  NeoTreeDirectoryName = { fg = colors.fg },
  NeoTreeDirectoryIcon = { fg = colors.keyword },
  NeoTreeRootName = { fg = colors.keyword, bold = true },
  NeoTreeFileName = { fg = colors.fg },
  NeoTreeFileIcon = { fg = colors.fg },
  NeoTreeFileNameOpened = { fg = colors.keyword },
  NeoTreeSymbolicLinkTarget = { fg = colors.keyword },
  NeoTreeIndentMarker = { fg = colors.border },
  NeoTreeGitAdded = { fg = colors.git_add },
  NeoTreeGitModified = { fg = colors.git_change },
  NeoTreeGitDeleted = { fg = colors.git_delete },
  NeoTreeGitUntracked = { fg = colors.git_add },
  NeoTreeGitIgnored = { fg = colors.fg_tertiary },
  NeoTreeGitStaged = { fg = colors.git_add },
  NeoTreeGitUnstaged = { fg = colors.git_change },
  NeoTreeGitConflict = { fg = colors.error },

  -- Indent Blankline
  IndentBlanklineChar = { fg = colors.border },
  IndentBlanklineContextChar = { fg = colors.border_variant },

  -- Leap.nvim
  LeapMatch = { fg = colors.bg, bg = colors.keyword, bold = true },
  LeapLabelPrimary = { fg = colors.bg, bg = colors.field, bold = true },
  LeapLabelSecondary = { fg = colors.bg, bg = colors.type_color, bold = true },

  -- Cmp
  CmpItemAbbrMatch = { fg = colors.keyword, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = colors.keyword, bold = true },
  CmpItemKindText = { fg = colors.string },
  CmpItemKindMethod = { fg = colors.function_name },
  CmpItemKindFunction = { fg = colors.function_name },
  CmpItemKindConstructor = { fg = colors.type_color },
  CmpItemKindField = { fg = colors.field },
  CmpItemKindVariable = { fg = colors.variable },
  CmpItemKindClass = { fg = colors.type_color },
  CmpItemKindInterface = { fg = colors.type_color },
  CmpItemKindModule = { fg = colors.namespace },
  CmpItemKindProperty = { fg = colors.field },
  CmpItemKindUnit = { fg = colors.number },
  CmpItemKindValue = { fg = colors.number },
  CmpItemKindEnum = { fg = colors.type_color },
  CmpItemKindKeyword = { fg = colors.keyword },
  CmpItemKindSnippet = { fg = colors.string },
  CmpItemKindColor = { fg = colors.field },
  CmpItemKindFile = { fg = colors.fg },
  CmpItemKindReference = { fg = colors.variable },
  CmpItemKindFolder = { fg = colors.keyword },
  CmpItemKindEnumMember = { fg = colors.field },
  CmpItemKindConstant = { fg = colors.constant },
  CmpItemKindStruct = { fg = colors.type_color },
  CmpItemKindEvent = { fg = colors.field },
  CmpItemKindOperator = { fg = colors.operator },
  CmpItemKindTypeParameter = { fg = colors.type_color },
}

-- Apply highlights
for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

return M
