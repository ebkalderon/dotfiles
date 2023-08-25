-- Better window navigation
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Navigate between buffers
vim.keymap.set("n", "<S-Left>", ":BufferLineCyclePrev<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Right>", ":BufferLineCycleNext<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<A-S-Left>", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<A-S-Right>", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<C-x>", ":bdelete<CR>", { desc = "Close buffer" })

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move line or text block up and down (Sublime Text style)
vim.keymap.set("n", "<S-Up>", ":move .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<S-Down>", ":move .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("i", "<S-Up>", "<Esc>:move .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("i", "<S-Down>", "<Esc>:move .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("x", "<S-Up>", ":move '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("x", "<S-Down>", ":move '>+1<CR>gv=gv", { desc = "Move line down" })

-- Language server shortcuts
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

    local bufopts = { noremap = true, silent = true, buffer = args.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
  end
})
