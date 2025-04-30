-- https://github.com/prominic/groovy-language-server.git

-- Derived from: https://www.reddit.com/r/groovy/comments/1eruc6o/comment/lyo20xh/
local function list_jar_files(dir)
  local files = {}

  local function scan(directory)
    local handle = vim.uv.fs_scandir(directory)
    if not handle then
      return
    end

    while true do
      local name, type = vim.uv.fs_scandir_next(handle)
      if not name then
        break
      end

      local full_path = directory .. "/" .. name
      if type == "directory" then
        scan(full_path)
      elseif name:match "%.jar$" then
        table.insert(files, full_path)
      end
    end
  end

  scan(dir)
  return files
end

---@type vim.lsp.Config
return {
  cmd = { "groovy-language-server" },
  filetypes = { "groovy" },
  root_markers = { ".git", "Jenkinsfile" },
  before_init = function(_, config)
    config.settings = {
      classpath = list_jar_files(os.getenv "HOME" .. "/.gradle/caches/modules-2/files-2.1"),
    }
  end,
}
