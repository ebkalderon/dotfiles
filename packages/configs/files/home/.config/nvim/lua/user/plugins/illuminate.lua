require('illuminate').configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 100,
  filetypes_denylist = { "gitcommit", "NvimTree", "TelescopePrompt" },
  modes_denylist = { "v", "V" }
})

vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3E3D32" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3E3D32" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3E3D32" })
