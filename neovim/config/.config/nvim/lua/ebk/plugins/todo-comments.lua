-- https://github.com/folke/todo-comments.nvim

---@type LazySpec
return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  }
}
