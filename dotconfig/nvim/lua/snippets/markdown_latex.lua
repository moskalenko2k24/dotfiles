local ls = require('luasnip');
local s = ls.snippet;
local t = ls.text_node;
local i = ls.insert_node;

-- "\frac" => "\frac{#1}{#2}"
ls.add_snippets('markdown', {
  s('\\frac', {
    t('\\frac{'), i(1, 'x'),
    t('}{'), i(2, 'y'), t('}')
  })
}, { type = 'autosnippets' })

-- "\floor" => "\lfloor #1 \rfloor"
ls.add_snippets('markdown', {
  s('\\floor', {
    t('\\lfloor '),
    i(1, 'x'),
    t(' \\rfloor')
  })
}, { type = 'autosnippets' })

-- "\sqrt" => "\sqrt{#1}"
ls.add_snippets('markdown', {
  s('\\sqrt', {
    t('\\sqrt{'),
    i(1, 'x'),
    t('}')
  })
}, { type = 'autosnippets' })

-- "\left" => "\left(#1\right)"
ls.add_snippets('markdown', {
  s('\\left', {
    t('\\left('),
    i(1, 'x'),
    t('\\right)')
  })
}, { type = 'autosnippets' })
