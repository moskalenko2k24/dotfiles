local language_servers = require('languages').language_servers

require('neodev').setup();
require('mason').setup();
require('mason-lspconfig').setup {
  ensure_installed = language_servers,
  automatic_installation = true
}
require('lsp_lines').setup();
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

local custom_attach = function(client, bufnr)
  -- Workaround for https://github.com/OmniSharp/omnisharp-roslyn/issues/2531
  -- if client.name == 'omnisharp' then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
  local function buf_set_keymap(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, {
      buffer = bufnr, noremap = true, silent = true
    });
  end;

  if client.supports_method('textDocument/hover') then
    buf_set_keymap('K', vim.lsp.buf.hover);
  end
  if client.supports_method('textDocument/declaration') then
    buf_set_keymap('gD', vim.lsp.buf.declaration);
  end
  buf_set_keymap('gd', vim.lsp.buf.definition);
  buf_set_keymap('gr', vim.lsp.buf.references);
  buf_set_keymap('<Leader>rn', vim.lsp.buf.rename);
  buf_set_keymap('[d', vim.diagnostic.goto_prev);
  buf_set_keymap(']d', vim.diagnostic.goto_next);
  buf_set_keymap('<Leader>ca', vim.lsp.buf.code_action);
  -- Toggle inlay hints
  buf_set_keymap('<Leader>I',
    function ()
      local inlay_hints_enabled =  vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr });
      vim.lsp.inlay_hint.enable(not inlay_hints_enabled, { bufnr = bufnr });
    end
  );
  -- Toggle LSP lines (errors on multiple lines)
  buf_set_keymap('<Leader>L',
    function ()
      require('lsp_lines').toggle();
      local virtual_text = vim.diagnostic.config().virtual_text
      vim.diagnostic.config({ virtual_text = not virtual_text });
    end
  );
  vim.lsp.inlay_hint.enable(false, { bufnr = bufnr });
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

-- After setting up mason-lspconfig you may set up servers via lsp.config
for _, server in pairs(language_servers) do
  vim.lsp.config(server, lsp_settings)
  -- require('lspconfig')[server].setup(lsp_settings);
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
