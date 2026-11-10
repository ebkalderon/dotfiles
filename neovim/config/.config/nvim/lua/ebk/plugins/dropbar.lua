-- https://github.com/Bekaboo/dropbar.nvim

---@type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    ---@type dropbar_configs_t
    opts = {},
  },
}
