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
  require("lsp-inlayhints").setup()
  vim.api.nvim_set_hl(0, "LspInlayHint", {
    fg = "#75715e",
    ctermfg = 14,
    bg = "#3e3d32",
    nocombine = false,
    blend = 50,
    italic = true,
    cterm = { italic = true },
  })
end

function M.setup()
  configure_diagnostics()
  configure_inlay_hints()
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

local function enable_progress_notifs(client)
  local notify = require("user.plugins.lsp.notify")

  vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    local client_id = ctx.client_id
    local val = result.value

    if not val.kind then
      return
    end

    local notif_data = notify.get_notif_data(client_id, result.token)

    if val.kind == "begin" then
      local message = notify.format_message(val.message, val.percentage)

      notif_data.notification = vim.notify(message, vim.log.levels.INFO, {
        title = notify.format_title(val.title, client.name),
        icon = notify.spinner_frames[1],
        timeout = false,
        hide_from_history = false,
      })

      notif_data.spinner = 1
      notify.update_spinner(ctx.client_id, result.token)
    elseif val.kind == "report" and notif_data then
      notif_data.notification = vim.notify(notify.format_message(val.message, val.percentage), vim.log.levels.INFO, {
        replace = notif_data.notification,
        hide_from_history = false,
      })
    elseif val.kind == "end" and notif_data then
      notif_data.notification =
      vim.notify(val.message and notify.format_message(val.message) or "Complete", vim.log.levels.INFO, {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000,
      })

      notif_data.spinner = nil
    end
  end
end

function M.on_attach(client, bufnr)
  enable_progress_notifs(client)
  require("lsp-inlayhints").on_attach(client, bufnr, false)
end

return M
