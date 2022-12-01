require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    custom_filter = function(bufnr, _)
      return vim.bo[bufnr].filetype ~= "dap-repl"
    end
  }
})
