require("transparent").setup({
  enable = true,
  extra_groups = { "VertSplit" },
  exclude = { "CursorLineNr", "LineNr", "SignColumn" },
})

vim.g.molokai_original = 1
vim.cmd("colorscheme molokai")

-- Minor color tweaks to Molokai
vim.api.nvim_set_hl(0, "FloatBorder", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })

-- Override default Neovim >=0.6.0 supplied "Underline" categories to use undercurl
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { cterm = { undercurl = true }, undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { cterm = { undercurl = true }, undercurl = true, sp = "Orange" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { cterm = { undercurl = true }, undercurl = true, sp = "LightBlue" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { cterm = { undercurl = true }, undercurl = true, sp = "LightGrey" })

-- Customize highlight groups for nvim-cmp
local normal = { ctermfg = 242, fg = "#F8F8F2", }
local match = { ctermfg = 242, fg = "#F8F8F2", bold = true }
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", match)
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", match)
vim.api.nvim_set_hl(0, "CmpItemKindText", normal)
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "Function" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "Function" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { link = "Type" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "Identifier" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "Constant" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "Type" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "Type" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "String" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", normal)
vim.api.nvim_set_hl(0, "CmpItemKindValue", { link = "String" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", normal)
vim.api.nvim_set_hl(0, "CmpItemKindColor", { link = "String" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { link = "String" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { link = "Identifier" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { link = "String" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "Constant" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "Constant" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", normal)
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { link = "Keyword" })
