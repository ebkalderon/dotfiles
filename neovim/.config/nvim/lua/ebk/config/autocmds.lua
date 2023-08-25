local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("ebk_" .. name, { clear = true })
end

autocmd("TextYankPost", {
  group = augroup("yank_highlight"),
  pattern = "*",
  desc = "Highlights yanked text",
  callback = function()
    vim.highlight.on_yank()
  end,
})
