require("mason-lspconfig").setup()

local handlers = require("user.plugins.lsp.handlers")
handlers.setup()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    })
  end,

  ["lua_ls"] = function(_)
    require("lspconfig").lua_ls.setup({
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
          hint = {
            enable = true,
          },
          workspace = {
            checkThirdParty = false
          },
        },
      },
    })
  end,
})

-- Example of `stdio` server
-- require("lspconfig.configs").nixlsp = {
--   default_config = {
--     cmd = { vim.env.HOME .. "/Documents/Projects/tower-lsp/target/debug/examples/stdio" },
--     filetypes = { "nix" },
--     root_dir = require("lspconfig.util").root_pattern("."),
--   }
-- }
--
-- require("lspconfig").nixlsp.setup({
--     on_attach = handlers.on_attach,
--     capabilities = handlers.capabilities,
-- })
