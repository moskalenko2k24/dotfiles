require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'omnisharp', 'tsserver', 'clangd', 'pyright', 'jdtls' },
  automatic_installation = true
}

-- LSP
local custom_attach = function(client, bufnr, elses)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local function buf_set_keymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, opts)
    end
	print('LSP started');
    -- require('completion').on_attach(client)
    -- require('diagnostic').on_attach(client)
    if client.supports_method('textDocument/hover') then
        buf_set_keymap('n', 'K', vim.lsp.buf.hover);
    end
    if client.supports_method('textDocument/declaration') then
        buf_set_keymap('n', 'gD', vim.lsp.buf.declaration);
    end
    buf_set_keymap('n', 'gd', vim.lsp.buf.definition);
    buf_set_keymap('n', 'gr', vim.lsp.buf.references);
    buf_set_keymap('n', '<Leader>rn', vim.lsp.buf.rename);
    buf_set_keymap('n', '[d', vim.diagnostic.goto_prev);
    buf_set_keymap('n', ']d', vim.diagnostic.goto_next);
end

local setupObj = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = custom_attach,
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
      },
    },
}

-- After setting up mason-lspconfig you may set up servers via lspconfig
require('lspconfig').omnisharp.setup(setupObj)
require('lspconfig').tsserver.setup(setupObj)
require('lspconfig').lua_ls.setup(setupObj)
require('lspconfig').clangd.setup(setupObj)
require('lspconfig').pyright.setup(setupObj)
require('lspconfig').jdtls.setup(setupObj)
