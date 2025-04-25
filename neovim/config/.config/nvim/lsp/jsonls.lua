-- https://github.com/hrsh7th/vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  settings = {
    provideFormatter = true,
  },
}
