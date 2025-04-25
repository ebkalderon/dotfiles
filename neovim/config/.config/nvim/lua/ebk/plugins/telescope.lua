-- https://github.com/nvim-telescope/telescope.nvim

---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    -- FIXME: https://github.com/nvim-telescope/telescope.nvim/issues/3439
    branch = "master", -- Fix for bug above is in `master`, switch away later
    pin = true, -- Pin to tip of `master`, remove when next release occurs
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        dependencies = { "kkharji/sqlite.lua" },
      },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
        extensions = {
          smart_open = {
            match_algorithm = "fzf",
            disable_devicons = not vim.g.have_nerd_font,
            -- FIXME: https://github.com/danielfalk/smart-open.nvim/issues/71
            mappings = {
              i = {
                ["<C-w>"] = function() vim.api.nvim_input("<C-S-w>") end,
              },
            },
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require("telescope.builtin")

      if pcall(require("telescope").load_extension, "smart_open") then
        vim.keymap.set("n", "<C-p>", function()
          require('telescope').extensions.smart_open.smart_open({ cwd_only = true })
        end, { desc = "Quick Open" })
      else
        vim.keymap.set("n", "<C-p>", builtin.oldfiles, { desc = 'Quick Open' })
      end

      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sM", builtin.man_pages, { desc = "[S]earch [M]an Pages" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })

      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })
    end,
  },
}
