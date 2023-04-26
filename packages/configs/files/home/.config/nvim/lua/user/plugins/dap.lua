require("mason-nvim-dap").setup()

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

local signs = {
  Breakpoint = {
    text = "",
    texthl = "DiagnosticSignError",
  },
  BreakpointCondition = {
    text = "ﳁ",
    texthl = "DiagnosticSignError",
  },
  BreakpointRejected = {
    text = "",
    texthl = "DiagnosticSignError",
  },
  LogPoint = {
    text = "",
    texthl = "DiagnosticSignInfo",
  },
  Stopped = {
    text = "",
    texthl = "DiagnosticSignWarn",
    linehl = "Visual",
    numhl = "DiagnosticSignWarn",
  },
}

for name, dict in pairs(signs) do
  vim.fn.sign_define("Dap" .. name, dict)
end

require("mason-nvim-dap").setup({
  handlers = {
    function(config)
      require('mason-nvim-dap').default_setup(config)
    end,

    codelldb = function(config)
      local codelldb_path = require("mason-registry").get_package("codelldb"):get_install_path()
      config.adapters.codelldb = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = codelldb_path .. "/codelldb",
          args = { "--liblldb", codelldb_path .. "/extension/lldb/lib/liblldb.so", "--port", "${port}" }
        }
      }

      config.configurations.c = {
        {
          type = "codelldb",
          request = "launch",
          name = "Launch Program (codelldb)",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          terminal = "integrated",
        },
      }

      config.configurations.cpp = config.configurations.c

      local hash = vim.fn.system({ "rustc", "-V", "-v" }):match("commit%-hash%: (%w+)")
      local sysroot = vim.fn.system({ "rustc", "--print", "sysroot" }):match("^%s*(.-)%s*$")
      config.configurations.rust = {
        {
          type = "codelldb",
          request = "launch",
          name = "Launch Program (codelldb)",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          terminal = "integrated",
          sourceLanguages = { "rust" },
          sourceMap = { ["/rustc/" .. hash .. "/"] = sysroot .. "/lib/rustlib/src/rust" },
        },
      }

      require("dap.ext.vscode").load_launchjs(nil, {
        codelldb = { "c", "cpp", "rust" },
      })
    end,
  }
})
