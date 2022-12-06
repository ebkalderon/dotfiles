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
vim.opt.fillchars = "eob: "

-- Override default Neovim >=0.6.0 supplied "Underline" categories to use undercurl
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { cterm = { undercurl = true }, undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { cterm = { undercurl = true }, undercurl = true, sp = "Orange" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { cterm = { undercurl = true }, undercurl = true, sp = "LightBlue" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { cterm = { undercurl = true }, undercurl = true, sp = "LightGrey" })
