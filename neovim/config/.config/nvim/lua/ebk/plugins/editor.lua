local Icons = require("ebk.util.icons")

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = Icons.gitsigns.add },
        change = { text = Icons.gitsigns.change },
        delete = { text = Icons.gitsigns.delete },
        topdelete = { text = Icons.gitsigns.topdelete },
        changedelete = { text = Icons.gitsigns.changedelete },
        untracked = { text = Icons.gitsigns.untracked },
      },
      signcolumn = true,
      numhl      = false,
      linehl     = false,
      word_diff  = false,
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("ebk.util").get_root() })
        end,
        desc = "Explorer (root dir)",
        remap = true,
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer (current dir)",
        remap = true,
      },
    },
    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
        tabs_layout = "equal",
        show_separator_on_edge = true,
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          -- expander config, needed for nesting files
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          -- The following settings are only a fallback, if you use
          -- nvim-web-devicons and configure default icons there then these will
          -- never be used.
          default = "",
        },
        modified = { symbol = "[+]" },
        git_status = { symbols = Icons.git },
      },
      filesystem = {
        -- This will find and focus the file in the active buffer every time the
        -- current file is changed while the tree is open.
        follow_current_file = { enabled = true },
      },
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree").setup({
            filesystem = {
              hijack_netrw_behavior = "open_current",
            },
          })
        end
      end
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = { "kevinhwang91/promise-async", event = "BufReadPost" },
    opts = {},
  },

  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = false,
        ft_ignore = { "neo-tree" },
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" }, -- Sign
          {
            -- Line number
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" }, -- Fold
        },
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function()
          if vim.bo.filetype == "neo-tree" then
            vim.opt_local.statuscolumn = ""
          end
        end,
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-project.nvim" },
      {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        dependencies = { "kkharji/sqlite.lua", "nvim-tree/nvim-web-devicons" },
      },
    },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        path_display = { "truncate" },
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          "target/",
          "%.gif",
          "%.jpeg",
          "%.jpg",
          "%.png",
        },
        results_title = "",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          hidden = true,
        },
        smart_open = {
          prompt_title = "Quick Open",
        },
      },
      extensions = {
        notify = {
          theme = "dropdown",
        },
        project = {
          hidden_files = true,
          theme = "dropdown",
          sync_with_nvim_tree = true,
        },
        smart_open = {
          match_algorithm = "fzf",
          prompt_title = "Quick Open",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("notify")
      telescope.load_extension("fzf")
      telescope.load_extension("project")
      telescope.load_extension("smart_open")
    end,
    keys = {
      -- Goto
      { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
      { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
      -- Search
      { "sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      { "sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "sg", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
      { "sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
      { "sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      { "sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      -- Git
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
      -- Find
      { "<C-j>", "<cmd>lua require('telescope').extensions.project.project({})<cr>", desc = "Open project" },
      {
        "<C-p>",
        function()
          require("telescope").extensions.smart_open.smart_open({
            prompt_title = "Quick Open",
            cwd_only = true,
            filename_first = false,
          })
        end,
        desc = "Quick open",
      },
    },
  },
}
