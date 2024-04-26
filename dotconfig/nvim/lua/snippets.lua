-- Useful links
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

local ls = require('luasnip');
local s = ls.snippet;
-- local sn = ls.snippet_node;
-- local isn = ls.indent_snippet_node;
local t = ls.text_node;
local i = ls.insert_node;

ls.config.set_config({
  enable_autosnippets = true
});

-- Use <Tab> to jump to next placeholder

ls.add_snippets('markdown', {
  s('link', {
    t('['), i(1, 'name'), t(']'), t('('), i(2, 'link'), t(')')
  })
}, { type = 'autosnippets' });
