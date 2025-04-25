-- https://github.com/nvim-neo-tree/neo-tree.nvim

local root_patterns = { ".git" }

-- Loosely based on LazyVim's implementation, with some tweaks:
-- https://github.com/LazyVim/LazyVim/blob/ec5981d/lua/lazyvim/util/root.lua#L171-L191
--
-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
local function get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.uv.fs_realpath(path) or nil

  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.uv.fs_realpath(p)
        if r ~= nil and path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)

  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.uv.cwd()
    ---@type string?
    root = vim.fs.find(root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.uv.cwd()
  end

  ---@cast root string
  return root
end

---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
        tabs_layout = "equal",
        show_separator_on_edge = true,
        truncation_character = "…",
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "",
            modified = "",
            removed = "",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "U",
            staged = "",
            conflict = "",
          },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = get_root()
          })
        end,
        desc = "Toggle [E]xplorer",
      },
    },
  },
}
