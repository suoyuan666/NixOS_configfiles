local telescope = require("telescope")
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local transform_mod = require("telescope.actions.mt").transform_mod

local trouble = require("trouble")
local trouble_telescope = require("trouble.sources.telescope")

-- or create your custom action
local custom_actions = transform_mod({
  open_trouble_qflist = function(prompt_bufnr)
    trouble.toggle("quickfix")
  end,
})

vim.keymap.set('n', '<leader>ss', function()
  builtin.lsp_document_symbols()
end, { desc = 'Telescope Document Symbols' })

telescope.setup({
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next,     -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
        ["<C-t>"] = trouble_telescope.open,
      },
    },
  },
})

telescope.load_extension("fzf")
