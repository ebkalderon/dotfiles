local nvim_tree_shift =  {
  function()
    return string.rep(' ', vim.api.nvim_win_get_width(require("nvim-tree.view").get_winnr()) - 2)
  end,
  cond = function()
    return packer_plugins["nvim-tree.lua"].loaded == true and require("nvim-tree.view").is_visible()
  end,
  color = 'NvimTreeNormal'
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "powerline",
    disabled_filetypes = { "NvimTree" },
    ignore_focus = {
      "dap-repl",
      "dapui_console",
      "dapui_breakpoints",
      "dapui_scopes",
      "dapui_stacks",
      "dapui_watches",
    }
  },
  sections = {
    lualine_a = { nvim_tree_shift, "mode" }
  },
})
