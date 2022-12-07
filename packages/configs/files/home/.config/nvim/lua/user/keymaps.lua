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
    -- Enable completion triggered by <C-space>
    vim.api.nvim_buf_set_option(args.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

    local bufopts = { noremap = true, silent = true, buffer = args.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set("n", "<leader>h", function() require("lsp-inlayhints").toggle() end, bufopts)

    vim.keymap.set("n", "<F4>", function() require("dapui").toggle({ reset = true }) end, bufopts)
    vim.keymap.set("n", "<F5>", function() require("dap").continue() end, bufopts)
    vim.keymap.set("n", "<F17>", function() require("dap").close() end, bufopts) -- <S-F5>
    vim.keymap.set("n", "<F9>", function() require("dap").toggle_breakpoint() end, bufopts)
    vim.keymap.set("n", "<F1>", function() require("dap").step_over() end, bufopts)
    vim.keymap.set("n", "<F2>", function() require("dap").step_into() end, bufopts)
    vim.keymap.set("n", "<F14>", function() require("dap").step_out() end, bufopts) -- <S-F2>
  end
})
