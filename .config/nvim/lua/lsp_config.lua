local cmp = require("cmp")
cmp.setup({
  snippet = {
    -- expand = function(args)
    --   luasnip.lsp_expand(args.body) -- For `luasnip` users.
    -- end,
  },
  window = { completion = { border = "single" } },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_locally_jumpable() then
      --   luasnip.expand_or_jump()
      -- elseif has_words_before() then
      --   cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
    -- { name = "cmdline" },
    -- { name = "neorg" },
    -- { name = "rg" },
  }),

  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      -- vim_item.kind =
      --   string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        treesitter = "[TS]",
      })[entry.source.name] or entry.source.name

      return vim_item
    end,
  },
})

-- LSP

local custom_attach = function(client, bufnr, elses)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local function buf_set_keymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, opts)
    end
	print("LSP started");
    -- require("completion").on_attach(client)
    -- require("diagnostic").on_attach(client)
    if client.supports_method("textDocument/hover") then
        buf_set_keymap("n", "K", vim.lsp.buf.hover);
    end
    if client.supports_method("textDocument/declaration") then
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
require("lspconfig").omnisharp.setup(setupObj)
require("lspconfig").tsserver.setup(setupObj)
require("lspconfig").lua_ls.setup(setupObj)
require("lspconfig").clangd.setup(setupObj)
