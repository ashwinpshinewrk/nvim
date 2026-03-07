vim.g.colors_name = "custom"

local colors = {
  bg = "#14161b",
fg = "#e0e2ea",
  comment = "#565f89",

    keyword = "#c6a0f6",
    string = "#98bb6c",
    func = "#7aa2f7",
    type = "#d27e99",

    line_nr = "#3b4261",
    selection = "#2d3f76"
}

local function hl(group,opts)
    vim.api.nvim_set_hl(0,group,opts)
end


vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.o.termguicolors = true

-- Core UI
hl( "Normal", { fg = colors.fg, bg = colors.bg })
hl( "SignColumn", { bg = colors.bg })
hl("LineNr", {fg=colors.line_nr})
hl( "Comment", { fg = colors.comment, italic = true })
hl( "CursorLine", { bg = "#1e222a" })
hl( "CursorLineNr", {fg = colors.keyword, bold = true})

hl("Visual", {bg = colors.selection})
hl("Selection", {bg = colors.type,fg= colors.bg})
hl("MatchParen", {fg = colors.keyword, bold= true, underline = true})
-- ==========================================================
-- SYNTAX (The Minimal Approach)
-- ==========================================================

-- COMMENTS: Push them to back
hl("Comment", { fg = colors.comment, italic = true })

-- CONSTANTS: Booleans, Numbers, Nulls -> Dusty Rose
hl("Constant", { fg = colors.type })
hl("Number",   { fg = colors.type })
hl("Boolean",  { fg = colors.type })

-- STRINGS: Sage Green
hl("String", { fg = colors.string })
hl("Character", { fg = colors.string })

-- KEYWORDS: Muted Mauve
-- Includes 'if', 'else', 'return', 'import'
hl("Keyword", { fg = colors.keyword, italic = true })
hl("Statement", { fg = colors.keyword })
hl("Conditional", { fg = colors.keyword })
hl("Repeat", { fg = colors.keyword })
hl("Operator", { fg = colors.fg }) -- Keep operators (+, =, -) white/clean

-- FUNCTIONS: Cornflower Blue
hl("Function", { fg = colors.func })
hl("Identifier", { fg = colors.fg }) -- Variables stay white! Important for minimalism.

-- TYPES: Dusty Rose (or bold white if you prefer even less color)
hl("Type", { fg = colors.type })
hl("Structure", { fg = colors.type })

-- ==========================================================
-- TREESITTER SPECIFICS (The "Smart" Layer)
-- ==========================================================
-- These link treesitter groups to the groups defined above

hl("@variable",          { link = "Identifier" }) -- Keeps variables White
hl("@variable.builtin",  { fg = colors.type })    -- 'this', 'self' gets color
hl("@property",          { link = "Identifier" }) -- Object properties stay White

hl("@function",          { link = "Function" })
hl("@function.builtin",  { link = "Function" })
hl("@function.call",     { link = "Function" })

hl("@keyword",           { link = "Keyword" })
hl("@keyword.function",  { link = "Keyword" }) -- 'function' or 'def'

hl("@string",            { link = "String" })

hl("@punctuation",       { fg = colors.fg }) -- Brackets/Parens stay White (Reduces noise)
hl("@punctuation.delimiter", { fg = colors.fg })

hl("@comment",           { link = "Comment" })

hl("@type",              { link = "Type" })
hl("@type.builtin",      { link = "Type" })

hl("@constructor",       { link = "Function" }) -- 'new Class()' -> Class is blue
