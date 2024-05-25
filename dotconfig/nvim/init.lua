-- USEFUL LINKS
-- https://neovim.io/doc/user/lua.html

-- TODO: HOT RELOAD OF init.lua
-- au BufWritePost  ~/.vimrc :source ~/.vimrc

require('settings');
require('mappings');
require('plugins');
require('treesitter');
require('lsp_config');
require('cmp_config');
require('snippets');
require('theme');
