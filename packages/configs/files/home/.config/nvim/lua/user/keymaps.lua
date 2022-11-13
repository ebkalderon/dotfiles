local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Toggle file explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Navigate between buffers
keymap("n", "<S-Left>", ":bprevious<CR>", opts)
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<C-x>", ":bdelete<CR>", opts)

-- Stay in visual mode while indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move line or text block up and down (Sublime Text style)
keymap("n", "<S-Up>", ":move .-2<CR>==", opts)
keymap("n", "<S-Down>", ":move .+1<CR>==", opts)
keymap("i", "<S-Up>", "<Esc>:move .-2<CR>==gi", opts)
keymap("i", "<S-Down>", "<Esc>:move .+1<CR>==gi", opts)
keymap("x", "<S-Up>", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<S-Down>", ":move '>+1<CR>gv=gv", opts)

-- Fuzzy search
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-j>", ":Telescope project<CR>", opts)

-- Language server shortcuts
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    -- Enable completion triggered by <C-space>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, bufopts)
    vim.keymap.set("n", "<leader>d", function()
      vim.diagnostic.open_float(bufnr, { focusable = false, severity_sort = false })
    end, bufopts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, bufopts)
  end
})