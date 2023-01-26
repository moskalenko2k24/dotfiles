local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end
local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, opts)
  end
local custom_attach = function(client, bufnr, elses)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local function buf_set_keymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, opts)
    end
	print("LSP started.");
	-- require'completion'.on_attach(client)
	-- require'diagnostic'.on_attach(client)
    if client.supports_method("textDocument/hover") then
        buf_set_keymap("n", "K", vim.lsp.buf.hover)
    end
	buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	buf_set_keymap('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	buf_set_keymap('n','<leader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_set_keymap('n', 'gr', vim.lsp.buf.references)

	-- map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	-- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	-- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	-- map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").omnisharp.setup {
    on_attach = custom_attach
}
require("lspconfig").tsserver.setup {
    on_attach = custom_attach
}
