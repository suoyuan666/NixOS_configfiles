local lspconfig = vim.lsp.config
local mason_lspconfig = require("mason-lspconfig")
local navic = require("nvim-navic")

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

-- local capabilities = require("mini.completion").get_lsp_capabilities()
-- vim.lsp.config('*', { capabilities = capabilities })

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- smart rename
    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- jump to previous diagnostic in buffer
    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- jump to next diagnostic in buffer
    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- show documentation for what is under cursor
    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)        -- mapping to restart lsp if necessary
  end,
})


mason_lspconfig.setup({
  ensure_installed = { 'pylsp', 'lua_ls' },
  automatic_enable = false
})

lspconfig("clangd", {
  init_options = {
    arguments = {
      '--background-index',
      '--clang-tidy',
      '-j=12',
    },
  },

  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
})

lspconfig("tinymist", {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
})

lspconfig("pylsp", {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
})

lspconfig("lua_ls", {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
})

lspconfig("rust_analyzer", {
  inlayHints = {
    enable = true,
  },
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
})

vim.lsp.enable("clangd")
vim.lsp.enable("tinymist")
vim.lsp.enable("pylsp")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("zls")
