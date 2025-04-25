-- https://github.com/kosayoda/nvim-lightbulb

---@type LazySpec
return {
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    opts = {
      sign = {
        enabled = true,
        priority = 20,
      },
      status_text = {
        enabled = true,
        text = "status_text",
        text_unavailable = "",
      },
      autocmd = {
        enabled = true,
        pattern = { "*" },
        events = { "CursorHold", "CursorHoldI", "LspAttach" },
      },
    },
  },
}
