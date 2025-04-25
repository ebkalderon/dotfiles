-- https://github.com/nvim-lualine/lualine.nvim

---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
      "loctvl842/monokai-pro.nvim",
      "linrongbin16/lsp-progress.nvim",
    },
    config = function()
      require("lsp-progress").setup({})

      require("lualine").setup({
        options = {
          theme = "monokai-pro",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            "filename",
            function()
              return require("lsp-progress").progress()
            end,
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { "neo-tree" },
      })

      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = function(_)
          require("lualine").refresh()
        end,
      })
    end,
  },
}
