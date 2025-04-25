-- https://github.com/williamboman/mason.nvim
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

local ensure_installed = {
  "bash-language-server",
  "clangd",
  "codelldb",
  "dockerfile-language-server",
  "emmet-language-server",
  "html-lsp",
  "json-lsp",
  "lua-language-server",
  "marksman",
  "pyright",
  "rust-analyzer",
  "yaml-language-server",
}

---@type LazySpec
return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-tool-installer").setup({
        ensure_installed = ensure_installed,
      })
    end,
  }
}
