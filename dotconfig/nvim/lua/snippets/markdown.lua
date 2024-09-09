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
add_code_snippet('#sh', 'bash');
add_code_snippet('#bash', 'bash');

-- Snippet for link
-- [$text]($link)

ls.add_snippets('markdown', {
  s('#link', {
    t('['), i(1, 'text'), t(']'), t('('), i(2, 'link'), t(')')
  })
}, { type = 'autosnippets' });

ls.add_snippets('markdown', {
  s('ссылка', {
    t('[ссылка]'), t('('), i(1, ''), t(')')
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

-- Snippets for headers
-- to change cyrillic (Shift + 3) № with #
-- №№ -> ##, №№№ -> ###, etc

ls.add_snippets('markdown', {
  s('№№', {
    t({ '##' })
  })
}, { type = 'autosnippets' });

ls.add_snippets('markdown', {
  s('#№', {
    t({ '##' })
  })
}, { type = 'autosnippets' });


ls.add_snippets('markdown', {
  s('№#', {
    t({ '##' })
  })
}, { type = 'autosnippets' });
