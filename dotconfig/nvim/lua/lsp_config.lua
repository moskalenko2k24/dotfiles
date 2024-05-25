-- take 'lspconfig server name' from this table
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
local servers = {
  'omnisharp', -- C#
  'tsserver',  -- JS / TS
  'lua_ls',    -- Lua
  'clangd',    -- C / C++
  'pyright',   -- Python
  'jdtls'      -- Java
};

require('neodev').setup();
require('mason').setup();
require('mason-lspconfig').setup {
  ensure_installed = servers,
  automatic_installation = true
}

local custom_attach = function(client, bufnr)
  -- Workaround for https://github.com/OmniSharp/omnisharp-roslyn/issues/2531
  -- if client.name == 'omnisharp' then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
  local opts = {
    buffer = bufnr,
    noremap = true,
    silent = true
  };
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, opts)
  end;
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
  buf_set_keymap('n', '<Leader>ca', vim.lsp.buf.code_action);
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr });
  print('LSP started');
end

local lsp_settings = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = custom_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      }
    }
  }
};

-- After setting up mason-lspconfig you may set up servers via lspconfig
local lspconfig = require('lspconfig');
for _, server in pairs(servers) do
  lspconfig[server].setup(lsp_settings);
end

-- function feedkeys(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true);
-- end

-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     local bufnr = vim.fn.bufnr('%')
--     vim.keymap.set('n', '<CR>', function()
--       feedkeys('n', '<CR>');
--       vim.api.nvim_command([[execute "normal! \<cr>"]])
--       vim.api.nvim_command(bufnr .. 'bd')
--     end, { buffer = bufnr })
--   end,
--   pattern = "qf",
-- })
