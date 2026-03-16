return {
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
      require("plugins.config.ui_bar_dark")
    end,
  },
  {
    "Bekaboo/deadcolumn.nvim",
    config = function()
      require("deadcolumn").setup({ columns = 80 })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function ()
          require('plugins.config.notify')
        end
      },
    },
    config = function()
      require("plugins.config.ui_noice")
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
  },
  {
    'echasnovski/mini.files',
    version = '*',
    dependencies = {
      {
        'echasnovski/mini.icons',
        version = '*',
        config = function()
          require('mini.icons').setup()
        end
      }
    },
    config = function()
      require('mini.files').setup()
    end
  },
  {
    "OXY2DEV/markview.nvim",
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}
