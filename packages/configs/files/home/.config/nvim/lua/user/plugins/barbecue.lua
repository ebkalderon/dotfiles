require("barbecue").setup({
  attach_navic = true,
  exclude_filetypes = {
    "gitcommit",
    "NvimTree",
    "toggleterm",
  },
  show_modified = true,
})

local background = "#272822"
vim.api.nvim_set_hl(0, "WinBar", { bg = background })
vim.api.nvim_set_hl(0, "BarbecueBasename", { fg = "#f8f8f2", bg = background })
vim.api.nvim_set_hl(0, "BarbecueContext", { fg = "#bcbcbc", bg = background })
vim.api.nvim_set_hl(0, "BarbecueDirname", { fg = "#75715e", bg = background })
vim.api.nvim_set_hl(0, "BarbecueEllipsis", { link = "BarbecueDirname" })
vim.api.nvim_set_hl(0, "BarbecueModified", { fg = "#e6db74", bg = background })
vim.api.nvim_set_hl(0, "BarbecueSeparator", { link = "BarbecueDirname" })
--
-- local highlights = {
--   "BarbecueContextFile",
--   "BarbecueContextModule",
--   "BarbecueContextNamespace",
--   "BarbecueContextPackage",
--   "BarbecueContextClass",
--   "BarbecueContextMethod",
--   "BarbecueContextProperty",
--   "BarbecueContextField",
--   "BarbecueContextConstructor",
--   "BarbecueContextEnum",
--   "BarbecueContextInterface",
--   "BarbecueContextFunction",
--   "BarbecueContextVariable",
--   "BarbecueContextConstant",
--   "BarbecueContextString",
--   "BarbecueContextNumber",
--   "BarbecueContextBoolean",
--   "BarbecueContextArray",
--   "BarbecueContextObject",
--   "BarbecueContextKey",
--   "BarbecueContextNull",
--   "BarbecueContextEnumMember",
--   "BarbecueContextStruct",
--   "BarbecueContextEvent",
--   "BarbecueContextOperator",
--   "BarbecueContextTypeParameter",
-- }
--
-- for _, name in pairs(highlights) do
--   local highlight = vim.api.nvim_get_hl_by_name(name, true)
--
--   highlight.fg = highlight.foreground
--   highlight.foreground = nil
--   highlight.bg = background
--   highlight.background = nil
--
--   if highlight[true] ~= nil then
--     highlight = vim.api.nvim_get_hl_by_id(highlight[true], true)
--   end
--
--   vim.api.nvim_set_hl(0, name, highlight)
-- end
--
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("Hello", { clear = true }),
--   pattern = "*",
--   callback = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local _, name = require("nvim-web-devicons").get_icon_by_filetype(vim.bo[bufnr].filetype)
--     if name ~= nil then
--       local highlight = vim.api.nvim_get_hl_by_name(name, true)
--
--       highlight.fg = highlight.foreground
--       highlight.foreground = nil
--       highlight.bg = "#272822"
--       highlight.background = nil
--
--       vim.api.nvim_set_hl(0, name, highlight)
--     end
--   end,
-- })
