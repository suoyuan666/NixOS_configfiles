return {
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "github/copilot.vim"
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = {
              name = "copilot",
              model = "gpt-4.1",
            },
          },
        },
      })
    end
  }
}
