-- https://github.com/loctvl842/monokai-pro.nvim

local hl_groups = { "Error", "Hint", "Info", "Ok", "Warn" }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight("DiagnosticUnderline" .. hl .. " gui=undercurl")
end

---@type LazySpec
return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    config = function()
      require("monokai-pro").setup({
        filter = "classic",
      })

      vim.cmd([[colorscheme monokai-pro-classic]])
    end,
  },
}
