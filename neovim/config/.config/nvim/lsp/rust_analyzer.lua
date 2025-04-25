-- https://github.com/rust-lang/rust-analyzer
-- https://rust-analyzer.github.io/book/configuration.html

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, { experimental = { serverStatusNotification = true } })

---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  capabilities = capabilities,
  root_markers = { ".git", "rust-project.json", "Cargo.toml" },
  settings = {},
}
