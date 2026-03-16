local colorscheme_dark = 'catppuccin-mocha'
local colorscheme_light = 'catppuccin-latte'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme_dark)
if not is_ok then
  vim.notify('colorscheme ' .. colorscheme_light .. ' not found!')
  return
end
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#F8EDEC" })
