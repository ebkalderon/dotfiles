require("mason").setup()
require("mason-lspconfig").setup()
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

    -- Linters
    "markdownlint",
    "shellcheck",
    "vint",
  },
})

local handlers = require("user.plugins.lsp.handlers")
handlers.setup()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    })
  end,

  ["sumneko_lua"] = function(_)
    require("lspconfig").sumneko_lua.setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
      before_init = function(params, config)
        require("neodev").setup({ lspconfig = false })
        require("neodev.lsp").before_init(params, config)
      end,

      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          },
          workspace = {
            checkThirdParty = false
          },
        },
      },
    })
  end,
})
