local M = {}

local function configure_diagnostics()
  local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = ""
  }

  for name, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    update_in_insert = true,
    severity_sort = true,
  })
end

local function configure_inlay_hints()
  require("lsp-inlayhints").setup({
    inlay_hints = {
      parameter_hints = {
        prefix = "  ",
      },
    },
  })
  vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#75715E", bg = "#303030" })
end

local function configure_progress_notifs()
  local notify = require("user.plugins.lsp.notify")
  local spinners = {}

  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("LspNotify", { clear = true }),
    pattern = "LspProgressUpdate",
    desc = "LSP progress notifications",
    callback = function()
      for _, c in pairs(vim.lsp.get_active_clients()) do
        for token, ctx in pairs(c.messages.progress) do
          if not spinners[c.id] then
            spinners[c.id] = {}
          end
          local s = spinners[c.id][token]
          if not ctx.done then
            if not s then
              local msg = notify.format_message(ctx.message, ctx.percentage)
              local opts = { title = notify.format_title(ctx.title, c.name) }
              spinners[c.id][token] = notify.Spinner(msg, vim.log.levels.INFO, opts)
            else
              s:update(notify.format_message(ctx.message, ctx.percentage))
            end
          else
            c.messages.progress[token] = nil
            if s then
              s:done(ctx.message or "Complete", nil, { icon = "" })
              spinners[c.id][token] = nil
            end
          end
        end
      end
    end,
  })
end

function M.setup()
  configure_diagnostics()
  configure_inlay_hints()
  configure_progress_notifs()
end

local function define_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

M.capabilities = define_capabilities()

function M.on_attach(client, bufnr)
  require("lsp-inlayhints").on_attach(client, bufnr, false)
end

return M
