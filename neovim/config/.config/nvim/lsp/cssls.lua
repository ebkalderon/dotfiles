-- https://github.com/hrsh7th/vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },
  init_options = { provideFormatter = true },
  settings = {
    css = { validate = true, format = { spaceAroundSelectorSeparator = true } },
    scss = { validate = true, format = { spaceAroundSelectorSeparator = true } },
    less = { validate = true, format = { spaceAroundSelectorSeparator = true } },
  },
}
