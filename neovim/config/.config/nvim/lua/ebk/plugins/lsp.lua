return {
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "folke/neodev.nvim", ft = "lua" },
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
    config = function()
      local signs = require("ebk.util.icons").diagnostics
      for name, icon in pairs(signs) do
        local function firstUpper(s)
          return s:sub(1, 1):upper() .. s:sub(2)
        end
        local hl = "DiagnosticSign" .. firstUpper(name)
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      vim.diagnostic.config(require("ebk.config.lsp").diagnostics)

      local function create_capabilities(ext)
        return vim.tbl_deep_extend(
          "force",
          {},
          ext or {},
          require("cmp_nvim_lsp").default_capabilities(),
          { textDocument = { foldingRange = { dynamicRegistration = false, lineFoldingOnly = true } } }
        )
      end

      local servers = require("ebk.config.lsp").servers
      local ext_capabilites = vim.lsp.protocol.make_client_capabilities()
      local capabilities = create_capabilities(ext_capabilites)

      local function setup(server)
        if servers[server] and servers[server].disabled then
          return
        end
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end

      local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          if not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      -- Temporary!
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      });

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "codelldb",
        "shellcheck",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
