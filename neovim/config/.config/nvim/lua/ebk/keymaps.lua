-- Map <space> as the <leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Simpler window navigation
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window", remap = true })

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move line or text block up and down (Sublime Text style)
vim.keymap.set("n", "<S-Up>", ":move .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<S-Down>", ":move .+1<CR>==", { desc = "Move current line down" })
vim.keymap.set("i", "<S-Up>", "<Esc>:move .-2<CR>==gi", { desc = "Move current line up" })
vim.keymap.set("i", "<S-Down>", "<Esc>:move .+1<CR>==gi", { desc = "Move current line down" })
vim.keymap.set("x", "<S-Up>", ":move '<-2<CR>gv=gv", { desc = "Move selected line/block up" })
vim.keymap.set("x", "<S-Down>", ":move '>+1<CR>gv=gv", { desc = "Move selected line/block down" })

-- Define custom text object for `|` characters
-- Useful for editing Rust/Ruby closure syntax or Bash pipelines
--
-- Examples:
--  - va| - [V]isually select [A]round [|]pipes
--  - ci| - [C]hange [I]nside [|]pipes
--  - yi| - [Y]ank [I]nside [|]pipes
vim.keymap.set({"x", "o"}, "i|", ":<C-u>normal! T|vt|<CR>", { desc = "inner block from | to |", noremap = true, silent = true })
vim.keymap.set({"x", "o"}, "a|", ":<C-u>normal! f|F|vf|<CR>", { desc = "block from | to |", noremap = true, silent = true })
