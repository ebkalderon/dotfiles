-- https://github.com/hrsh7th/vscode-langservers-extracted

---@type vim.lsp.Config
return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  settings = {
    json = {
      format = { enable = true },
      validate = { enable = true },
      schemas = {
        {
          fileMatch = { "compile_commands.json" },
          url = "https://json.schemastore.org/compile-commands.json",
        },
        {
          fileMatch = { "dockerd.json" },
          url = "https://json.schemastore.org/dockerd.json",
        },
        {
          fileMatch = { "feed.json" },
          url = "https://json.schemastore.org/feed.json",
        },
        {
          fileMatch = { "jsconfig.json" },
          url = "https://json.schemastore.org/jsconfig.json",
        },
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
    },
  },
}
