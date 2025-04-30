-- https://github.com/prominic/groovy-language-server.git

---@type vim.lsp.Config
return {
  cmd = { "groovy-language-server" },
  filetypes = { "groovy" },
  root_markers = { ".git", "Jenkinsfile" },
  settings = {},
}
