require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    -- Language servers
    "bash-language-server",
    "clangd",
    "dockerfile-language-server",
    "html-lsp",
    "jdtls",
    "json-lsp",
    "lua-language-server",
    "python-lsp-server",
    "rust-analyzer",
    "texlab",
    "typescript-language-server",
    "vim-language-server",
    "yaml-language-server",
  },
})
