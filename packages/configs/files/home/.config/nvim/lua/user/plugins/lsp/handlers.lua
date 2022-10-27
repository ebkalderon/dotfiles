local M = {}

local function enable_diagnostic_float()
  vim.api.nvim_create_autocmd("CursorHold", {
    group = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true }),
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
  })
end

local function enable_gutter_diagnostics()
  local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = ""
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local function enable_inlay_hints(client, bufnr)
  local inlay_hints = require("lsp-inlayhints")
  inlay_hints.setup()
  vim.api.nvim_set_hl(0, "LspInlayHint",
    { fg = "#75715e", ctermfg = 14, bg = "#3e3d32", nocombine = false, blend = 50, italic = true,
      cterm = { italic = true } })
  inlay_hints.on_attach(client, bufnr, false)
end

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

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.on_attach = function(client, bufnr)
  enable_diagnostic_float()
  enable_gutter_diagnostics()
  enable_inlay_hints(client, bufnr)
  enable_progress_notifs(client)
end

return M
