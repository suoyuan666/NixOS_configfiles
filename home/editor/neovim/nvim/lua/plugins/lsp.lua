return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "echasnovski/mini.completion",
    },
    config = function()
      require('plugins.config.lsp')
    end,
  },

  "williamboman/mason-lspconfig.nvim",

  {
    "neovim/nvim-lspconfig",
    config = function()
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "OXY2DEV/markview.nvim",
    },
    build = ':TSUpdate',
    event = 'BufRead',
    cond = vim.g.is_not_large,
    config = function()
      require('plugins.config.treesitter')
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
