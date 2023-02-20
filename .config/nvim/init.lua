-- HOT RELOAD OF init.lua
-- TO DO THIS!
-- au BufWritePost  ~/.vimrc :source ~/.vimrc

require("settings");
require("mappings");

-- Autocomplete on C-Space
-- TO DO THIS!

-- STATUSLINE
-- TO DO (SHOW MODE AT LEFT)
-- filename[modified] encoding[line ending], line:column percentage
vim.o.statusline = '%f%m %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %= %l:%c %p%%'

require('plugins')
require('lsp_config')
require('theme')
