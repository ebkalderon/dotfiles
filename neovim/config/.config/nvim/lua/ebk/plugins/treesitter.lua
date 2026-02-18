-- https://github.com/nvim-treesitter/nvim-treesitter

---@type LazySpec
return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      "bash",
      "c",
      "cpp",
      "diff",
      "dockerfile",
      "gitignore",
      "groovy",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "rust",
      "scss",
      "sql",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    config = function(_, opts)
      require("nvim-treesitter").setup()
      require("nvim-treesitter").install(opts):wait(300000)

      local patterns = {}
      for _, parser in ipairs(opts) do
        local parser_patterns = vim.treesitter.language.get_filetypes(parser)
        for _, pp in pairs(parser_patterns) do
          table.insert(patterns, pp)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable Treesitter features for all supported languages",
        pattern = patterns,
        callback = function()
          -- Enable syntax highlighting
          vim.treesitter.start()

          -- Enable augmented code folding
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
        end,
      })
    end,
  },
}
