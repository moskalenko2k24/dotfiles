local ls = require('luasnip');
local s = ls.snippet;
local t = ls.text_node;
local i = ls.insert_node;

local add_code_snippet = function(snippet, language)
  ls.add_snippets('markdown', {
    s(snippet, {
      t({ '```' .. language, '' }),
      i(1, 'code'),
      t({ '', '```'}),
    })
  }, { type = 'autosnippets' });
end

-- Snippets for code blocks
-- ```javascript
-- $code
-- ```

add_code_snippet('#js', 'javascript');
add_code_snippet('#csharp', 'cs');
add_code_snippet('#cpp', 'cpp');

-- Snippet for link
-- [$text]($link)

ls.add_snippets('markdown', {
  s('#link', {
    t('['), i(1, 'text'), t(']'), t('('), i(2, 'link'), t(')')
  })
}, { type = 'autosnippets' });

-- Snippet for spoiler
-- <details>
--   <summary>$summary</summary>
--
--   $content
-- </details>

ls.add_snippets('markdown', {
  s('#spoiler', {
    t({ '<details>', '' }),
    t({ '  <summary>' }), i(1, 'summary'),
    t({ '</summary>', '', '  '}),
    i(2, 'content'),
    t({  '', '</details>' })
  })
}, { type = 'snippets' });
