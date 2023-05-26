require("ebk.config.options")
require("ebk.config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("ebk.config.autocmds")
    require("ebk.config.keymaps")
  end,
})
