-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in Nvim

vim.opt.tabstop = 2               -- number of visual spaces per TAB
vim.opt.softtabstop = 2           -- number of spacesin tab when editing
vim.opt.shiftwidth = 2            -- insert 2 spaces on a tab
vim.opt.expandtab = true          -- tabs are spaces, mainly because of python
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

vim.opt.number = true     -- show absolute number
vim.opt.relativenumber = true
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.showmode = true   -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.laststatus = 3

vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

vim.opt.termguicolors = true
vim.o.cmdheight = 0
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.notify("File saved", "info", { title = "Notification" })
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '',
  }
})
vim.diagnostic.config({
  update_in_insert = true,
})
