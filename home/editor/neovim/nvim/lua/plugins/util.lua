return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require('plugins.config.telescope')
    end,
  },
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
}
