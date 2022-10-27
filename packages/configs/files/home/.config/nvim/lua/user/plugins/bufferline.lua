require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  }
})
