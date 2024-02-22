local Icons = require("ebk.util.icons")

return {
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    cmd = "Barbecue",
    dependencies = {
      { "smiteshp/nvim-navic", lazy = true },
      { "neovim/nvim-lspconfig" },
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      exclude_filetypes = {
        "gitcommit",
        "help",
        "neo-tree",
        "toggleterm",
      },
      show_modified = true,
      theme = {
        normal = { bg = "#3b3a32" },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match("error") and Icons.diagnostics.error or Icons.diagnostics.warn
          return " " .. icon .. " " .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "center",
          },
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = { enabled = false },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "powerline",
        ignore_focus = {
          "neo-tree",
          "TelescopePrompt",
          "toggleterm",
        },
        globalstatus = true,
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy", "!neo-tree" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background",
      },
    },
  },

  {
    "kosayoda/nvim-lightbulb",
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

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>n",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      icons = {
        ERROR = Icons.diagnostics.error .. " ",
        INFO = Icons.diagnostics.info .. " ",
        WARN = Icons.diagnostics.warn .. " ",
      },
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      background_colour = "#000000",
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          vim.notify = require("notify")
        end,
      })
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  { "MunifTanjim/nui.nvim", lazy = true },

  {
    "akinsho/toggleterm.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
    },
  },

  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    opts = {},
    keys = {
      { "<C-w>z", "<cmd>WindowsMaximize<CR>", desc = "Zoom window" },
    },
    init = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 3
      vim.o.equalalways = true
    end,
  },
}
