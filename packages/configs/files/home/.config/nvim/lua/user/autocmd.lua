local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  group = augroup("PackerUserConfig", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
  desc = "Syncs plugins after editing plugins.lua",
})

autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
  desc = "Highlights yanked text",
})
