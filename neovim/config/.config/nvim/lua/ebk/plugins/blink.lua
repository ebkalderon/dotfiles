-- https://github.com/saghen/blink.cmp

---@type LazySpec
return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
  },
  build = function()
    require("blink.cmp").build():pwait()
  end,
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      menu = {
        auto_show = function(_)
          return vim.fn.getcmdtype() == ":"
        end,
        draw = {
          columns = { { "kind_icon", "label", gap = 1 }, { "label_description" }, { "kind" } },
          padding = 1,
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = { lua = { inherit_defaults = true, "lazydev" } },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- higher priority than lsp (see `:h blink.cmp`)
        }
      },
    },
    fuzzy = { implementation = "rust" },
  },
}
