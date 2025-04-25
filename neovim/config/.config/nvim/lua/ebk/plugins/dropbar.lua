-- https://github.com/Bekaboo/dropbar.nvim

---@type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      require("dropbar").setup({})
      vim.cmd.highlight("DropBarIconKindFolder guifg=#6e7066 guibg=NONE")
    end,
  },
}
