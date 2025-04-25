-- https://github.com/hrsh7th/vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "htmldjango", "htmlangular" },
  root_markers = { ".git" },
  settings = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
}
