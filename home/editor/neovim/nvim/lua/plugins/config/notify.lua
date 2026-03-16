local notify = require("notify");

notify.setup({
  stages = 'fade_in_slide_out',
  level = 2,
  timeout = 1000,
  render = "compact",
  fps = 60,
  -- max_height = function() return math.floor(vim.o.lines * 0.50) end,
  -- max_width = function() return math.floor(vim.o.columns * 0.45) end,
  -- on_open = function(win) vim.api.nvim_win_set_config(win, { focusable = false }) end
})

vim.notify = notify;
