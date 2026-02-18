-- https://github.com/nvim-treesitter/nvim-treesitter

---@type LazySpec
return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      require("nvim-treesitter").install({ "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" })
    end,
  },
}
