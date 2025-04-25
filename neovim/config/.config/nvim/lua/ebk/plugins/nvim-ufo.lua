-- https://github.com/kevinhwang91/nvim-ufo

---@type LazySpec
return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = { "kevinhwang91/promise-async", event = "BufReadPost" },
    opts = {},
  },
}
