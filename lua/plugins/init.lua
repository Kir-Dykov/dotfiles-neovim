--print("plugins/init.lua is executed")
return {
  -- {
  --   "stevearc/conform.nvim",
  --   -- event = 'BufWritePre', -- uncomment for format on save
  --   opts = require "configs.conform",
  -- },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      local dapvt = require "nvim-dap-virtual-text"
      dapui.setup()
      dapvt.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            -- return vim.fn.input("Path to your best executable: ", vim.fn.getcwd() .. "/", "file")
            return vim.fn.expand("%:p:r") .. ".o"
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          -- reverseDebugging = true,
        },
      }

      -- dap.listeners.after.event_initialized["dapui_config"] = function()
      --   dapui.open()
      -- end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },

  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      require "configs.vimtex"
    end,
  },

  { "mbbill/undotree", event = "VeryLazy" },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require "configs/leap"
    end,
  },

  {
    "voldikss/vim-mma",
    ft = "mma",
    -- config = function()
    --   vim.g.mma_highlight_option = "solarized"
    -- end,
  },
  -- { "rsmenon/vim-mathematica", event = "VeryLazy" },
  -- { "rsmenon/vim-mathematica", event = "VeryLazy" },
  --
}
