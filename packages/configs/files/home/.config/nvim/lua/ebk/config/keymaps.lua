-- Better window navigation
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")

-- Navigate between buffers
vim.keymap.set("n", "<S-Left>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<S-Right>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-x>", ":bdelete<CR>")

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move line or text block up and down (Sublime Text style)
vim.keymap.set("n", "<S-Up>", ":move .-2<CR>==")
vim.keymap.set("n", "<S-Down>", ":move .+1<CR>==")
vim.keymap.set("i", "<S-Up>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("i", "<S-Down>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("x", "<S-Up>", ":move '<-2<CR>gv=gv")
vim.keymap.set("x", "<S-Down>", ":move '>+1<CR>gv=gv")
