vim.cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
  local get_config = function(name)
    return string.format('require("user.plugins.%s")', name)
  end

  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim" }

  -- Colorscheme
  use { "tamelion/neovim-molokai" }
  use { "xiyaowong/nvim-transparent" }

  -- Appearance
  use { "akinsho/bufferline.nvim", config = get_config("bufferline") }
  use { "lewis6991/gitsigns.nvim", config = get_config("gitsigns") }
  use { "lukas-reineke/indent-blankline.nvim", config = get_config("indent-blankline") }
  use { "RRethy/vim-illuminate", config = get_config("illuminate") }
  use { "rcarriga/nvim-notify", requires = { "nvim-lua/plenary.nvim" }, config = get_config("notify") }
  use { "lukas-reineke/virt-column.nvim", config = get_config("virt-column") }

  -- Text editing
  use { "windwp/nvim-autopairs", config = get_config("autopairs") }
  use { "numToStr/Comment.nvim", config = get_config("comment") }
  use { "Glench/Vim-Jinja2-Syntax", ft = "jinja" }
  use { "rust-lang/rust.vim", ft = "rust" }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = get_config("lualine"),
  }

  -- Autocompletion support
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      { "saadparwaiz1/cmp_luasnip", { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" } },
      "onsails/lspkind.nvim",
      "folke/neodev.nvim",
      "windwp/nvim-autopairs",
    },
    config = get_config("cmp"),
  }

  -- LSP support
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "lvimuser/lsp-inlayhints.nvim",
    },
    config = get_config("lsp"),
  }

  -- Fuzzy search
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim" },
    cmd = "Telescope",
    config = get_config("telescope"),
  }

  -- File explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    cmd = "NvimTreeToggle",
    module = "telescope",
    config = get_config("nvim-tree"),
  }

  -- Terminal mode
  use { "akinsho/toggleterm.nvim", config = get_config("toggleterm") }

  if packer_bootstrap then
    packer.sync()
  end
end)
