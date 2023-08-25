-- Map <space> as <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation options
vim.opt.expandtab = true                        -- Convert tabs to spaces (use soft tabs)
vim.opt.shiftwidth = 4                          -- Define soft tab width
vim.opt.smartindent = true                      -- Copy indent from current line when starting a new line
vim.opt.tabstop = 4                             -- Define hard tab width

-- Appearance options
vim.opt.cursorline = true                       -- Highlight current line
vim.opt.fillchars = {
  foldopen = "",                               -- Set fill character for open code fold
  foldclose = "",                              -- Set fill character for closed code fold
  fold = " ",                                   -- Disable `·` fill character for `foldtext`
  foldsep = " ",                                -- Disable `│` fill character for open fold middle marker
  eob = " ",                                    -- Disable `~` fill character after EOF
}
vim.opt.number = true                           -- Enable line numbers
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"                      -- Always show sign column (prevents LSP inlay hints from shifting text)
vim.opt.termguicolors = true                    -- Enable full 256 colors in terminal

-- Search and popup menu appearance
vim.opt.hlsearch = true                         -- Highlight all matches while typing
vim.opt.incsearch = true                        -- Jump straight to next matching result while typing
vim.opt.pumblend = 20                           -- Set translucency of completion popup menu
vim.opt.pumheight = 12                          -- Set maximum height for completion popup menu

-- Text wrapping options
vim.opt.scrolloff = 8                           -- Minimum number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- Minimum number of screen lines to keep to the left and right of the cursor
vim.opt.wrap = false                            -- Disable text wrapping

-- Folding options
vim.opt.foldenable = true                       -- Enable code folding
vim.opt.foldcolumn = "1"                        -- Show fold column
vim.opt.foldlevel = 99                          -- Open all folds by default
vim.opt.foldlevelstart = 99                     -- Open all folds when editing new buffer

-- Completion options
vim.opt.completeopt = { "menuone", "noselect" } -- IDE-like completion behavior
vim.opt.updatetime = 250                        -- Decrease update interval (faster LSP completions)

-- Navigation options
vim.opt.hidden = true                           -- Hide unused buffers
vim.opt.splitbelow = true                       -- Force all horizontal splits to appear below current window
vim.opt.splitright = true                       -- Force all vertical splits to appear to the right of current window

-- Backup options
vim.opt.undofile = true                         -- Enable persistent undo

-- System options
vim.opt.clipboard = "unnamedplus"               -- Integrate with system clipboard
vim.opt.mouse = "a"                             -- Enable mouse support
vim.opt.mousemoveevent = true                   -- Enable "mouse moved" event (Neovim 0.8+)
