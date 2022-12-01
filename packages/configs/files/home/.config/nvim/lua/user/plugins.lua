local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require("packer")

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  local load_file = function(name)
    return 'require("user.plugins.' .. name .. '")'
  end

  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim" }

  -- Colorscheme
  use { "tamelion/neovim-molokai" }
  use { "xiyaowong/nvim-transparent" }

  -- Appearance
  use { "akinsho/bufferline.nvim", config = load_file("bufferline") }
  use { "lewis6991/gitsigns.nvim", config = load_file("gitsigns") }
  use { "lukas-reineke/indent-blankline.nvim", config = load_file("indent-blankline") }
  use { "RRethy/vim-illuminate", config = load_file("illuminate") }
  use { "rcarriga/nvim-notify", requires = { "nvim-lua/plenary.nvim" }, config = load_file("notify") }
  use { "lukas-reineke/virt-column.nvim", config = load_file("virt-column") }

  -- Text editing
  use { "windwp/nvim-autopairs", config = load_file("autopairs") }
  use { "numToStr/Comment.nvim", config = load_file("comment") }
  use { "Glench/Vim-Jinja2-Syntax" }
  use { "rust-lang/rust.vim", ft = "rust" }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = load_file("lualine"),
  }

  -- Autocompletion support
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
      "hrsh7th/cmp-path",
      { "saadparwaiz1/cmp_luasnip", requires = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" } },
      "onsails/lspkind.nvim",
      "windwp/nvim-autopairs",
    },
    config = load_file("cmp"),
  }

  -- Package manager for LSP, DAP, linters, etc.
  use {
    "williamboman/mason.nvim",
    requires = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = load_file("mason"),
  }

  -- LSP support
  use {
    "neovim/nvim-lspconfig",
    wants = "mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      { "folke/neodev.nvim", module = "neodev" },
    },
    config = load_file("lsp"),
  }

  -- Fuzzy search
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-project.nvim",
      {
        "nvim-telescope/telescope-ui-select.nvim",
        setup = function()
          vim.ui.select = function(...)
            require("telescope")
            vim.ui.select(...)
          end
        end,
      },
    },
    cmd = "Telescope",
    module_pattern = "telescope",
    config = load_file("telescope"),
  }

  -- File explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    cmd = "NvimTreeToggle",
    module = "telescope",
    config = load_file("nvim-tree"),
  }

  -- Terminal mode
  use { "akinsho/toggleterm.nvim", config = load_file("toggleterm") }

  if packer_bootstrap then
    packer.sync()
  end
end)
