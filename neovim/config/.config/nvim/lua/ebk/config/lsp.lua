return {
  diagnostics = {
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  },
  servers = {
    bashls = {},
    clangd = {},
    cssls = {},
    dockerls = {},
    html = {},
    jdtls = {},
    jsonls = {},

    lua_ls = {
      before_init = function(params, config)
        require("neodev").setup({ lspconfig = false })
        require("neodev.lsp").before_init(params, config)
      end,

      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            globals = { "vim" },
          },
          hint = {
            enable = true,
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    },

    rust_analyzer = {},
    texlab = {},
    tsserver = {},
    vimls = {},
    yamlls = {},
  },
}
