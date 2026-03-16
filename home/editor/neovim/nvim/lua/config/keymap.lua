local opts = {
  noremap = true,
  silent = true,
}
local map = vim.api.nvim_set_keymap

map('n', '<c-s>', '<Cmd> update<CR>', opts)
map('i', '<c-s>', '<Cmd> update<CR>', opts)

map('i', '<C-h>', '<Left>', { noremap = true, silent = true })
map('i', '<C-l>', '<Right>', { noremap = true, silent = true })
map('i', '<C-j>', '<Down>', { noremap = true, silent = true })
map('i', '<C-k>', '<Up>', { noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map("n", "H", "^", opts)
map("n", "L", "$", opts)
map("v", "H", "^", opts)
map("v", "L", "$", opts)

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

map("n", "<Space>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<Space>fof", "<cmd>Telescope oldfiles<cr>", opts)
map("n", "<Space>sg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<Space>ss", "<cmd>Telescope grep_string<cr>", opts)
map("n", "<Space>tt", "<cmd>Telescope<cr>", opts)
map("n", "<Space>gc", "<cmd>Telescope git_commits<cr>", opts)
map("n", "<Space>gs", "<cmd>Telescope git_status<cr>", opts)
map("n", "<Space>cd", "<cmd>Telescope diagnostics<cr>", opts)
map("n", "<Space>cld", "<cmd>Telescope lsp_definitions<cr>", opts)
map("n", "<Space>clr", "<cmd>Telescope lsp_references<cr>", opts)
map("n", "<Space>clic", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
map("n", "<Space>cloc", "<cmd>Telescope lsp_outgoing_calls<cr>", opts)

map('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", opts)
map('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", opts)
map('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", opts)
map('n', '<S-F11>', "<cmd>lua require'dap'.step_out()<CR>", opts)
map('n', '<C-F5>', "<cmd>lua require'dap'.repl.open()<CR>", opts)
map('n', '<Space>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map('n', '<Space>dwa', "<cmd>lua require'dapui'.elements.watches.add()<CR>", opts)

map('n', '<Space>teh', '<cmd> ToggleTerm direction=horizontal<cr>', opts)
map('n', '<space>tef', '<cmd> ToggleTerm direction=float<cr>', opts)
map('n', '<space>tev', '<cmd> ToggleTerm direction=vertical<cr>', opts)

map('n', '<space>e', '<cmd> lua MiniFiles.open() <cr>', opts)
map('n', '<space>ec', '<cmd> lua MiniFiles.close()<cr>', opts)

map('n', '<space>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })
