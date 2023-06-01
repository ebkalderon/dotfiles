return {
  {
    "tamelion/neovim-molokai",
    enabled = true,
    lazy = false,
    priority = 10000,
    config = function()
      vim.g.molokai_original = 1
      vim.cmd.colorscheme("molokai")

      -- Minor color tweaks to Molokai
      vim.api.nvim_set_hl(0, "FoldColumn", { link = "LineNr" })
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = vim.g.terminal_color_2, bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = vim.g.terminal_color_1, bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FD971F", bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })

      -- Override default Neovim >=0.6.0 supplied "Underline" categories to use undercurl
      local function set_undercurl_hl(name, color)
        vim.api.nvim_set_hl(0, name, { cterm = { undercurl = true }, undercurl = true, sp = color })
      end
      set_undercurl_hl("DiagnosticUnderlineError", vim.g.terminal_color_1)
      set_undercurl_hl("DiagnosticUnderlineWarn", "#FD971F")
      set_undercurl_hl("DiagnosticUnderlineInfo", vim.g.terminal_color_4)
      set_undercurl_hl("DiagnosticUnderlineHint", "LightGray")

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = vim.g.terminal_color_1, bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#FD971F", bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = vim.g.terminal_color_4, bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "LightGray", bg = "#3b3a32" })

      -- Fix nvim-treesitter highlight group mappings
      vim.api.nvim_set_hl(0, "@constructor.lua", { link = "Type" })
      vim.api.nvim_set_hl(0, "@field", { link = "Normal" })
      vim.api.nvim_set_hl(0, "@function.builtin.lua", { link = "Function" })
      vim.api.nvim_set_hl(0, "@label.ruby", { link = "Identifier" })
      vim.api.nvim_set_hl(0, "@keyword.function", { link = "Special" })
      vim.api.nvim_set_hl(0, "@keyword.function.ruby", { link = "Keyword" })
      vim.api.nvim_set_hl(0, "@property.c", { link = "Normal" })
      vim.api.nvim_set_hl(0, "@storageclass", { link = "Keyword" })
      vim.api.nvim_set_hl(0, "@type.qualifier", { link = "Keyword" })
      vim.api.nvim_set_hl(0, "@symbol.ruby", { link = "Boolean" })
      vim.api.nvim_set_hl(0, "@variable", { link = "Normal" })

      -- Adjust NeoTree highlight group mappings
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = vim.g.terminal_color_7, bg = vim.g.terminal_color_0 })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "NeoTreeNormal" })
      vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = vim.g.terminal_color_2 })
      vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = vim.g.terminal_color_1 })
      vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#FD971F" })
      vim.api.nvim_set_hl(0, "NeoTreeTabActive", { bold = true, bg = vim.g.terminal_color_0 })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "#0a0a0a", bg = vim.g.terminal_color_0 })
      vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { fg = "#3b3a32", bg = "#3b3a32" })
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#3b3a32", bg = "#3b3a32" })
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 9999,
    opts = {
      extra_groups = { "VertSplit" },
      exclude_groups = { "CursorLineNr", "LineNr", "SignColumn" },
    },
  },
}
