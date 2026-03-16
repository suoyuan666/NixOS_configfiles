return {
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      -- "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",         -- lsp auto-completion
      "hrsh7th/cmp-buffer",           -- buffer auto-completion
      "hrsh7th/cmp-path",             -- path auto-completion
      "hrsh7th/cmp-cmdline",          -- cmdline auto-completion
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",     -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
    },
    event = "InsertEnter",
    config = function()
      require("plugins.config.cmp")
    end,
  },
  -- {
  --   'echasnovski/mini.completion',
  --   version = '*',
  --   lazy = false,
  --   config = function()
  --     require('mini.completion').setup()
  --   end,
  --   dependencies = {
  --     {
  --       'echasnovski/mini.icons',
  --       version = '*',
  --       config = function()
  --         require('mini.icons').setup()
  --       end
  --     },
  --     {
  --       'echasnovski/mini.snippets',
  --       version = '*',
  --       config = function()
  --         local gen_loader = require('mini.snippets').gen_loader
  --         require('mini.snippets').setup({
  --           snippets = {
  --             gen_loader.from_lang(),
  --           },
  --         })
  --       end,
  --       dependencies = { "rafamadriz/friendly-snippets" },
  --     }
  --   }
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
}
