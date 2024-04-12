local g = vim.g         -- globals
local opt = vim.opt     -- options
local utils = require('utils')
local set_indent = utils.set_indent;
local set_indent_for = utils.set_indent_for;

-- MAIN SETTINGS
vim.cmd 'syntax on'                  -- syntax highlighting
opt.compatible = false               -- no compatible with Vi
opt.number = true                    -- show line numbers
opt.relativenumber = false           -- don't show relative numbers
opt.hidden = true                    -- enable closing buffers with unsaved changes
opt.clipboard = 'unnamedplus'        -- use system clipboard (Linux)
opt.encoding = 'utf-8'               -- default encoding
opt.fileencodings = 'utf-8,cp1251'   -- automatically detected encodings
opt.swapfile = true                  -- enable saving swap files (backup if editor crashes)

-- INDENT SETTINGS
opt.tabstop = 4                      -- default indent width
opt.softtabstop = 4                  -- default tab width
opt.shiftwidth = 4                   -- default shift width
opt.autoindent = true                -- autoindent
opt.expandtab = true                 -- use spaces instead of tabs
g.editorconfig = true                -- EditorConfig support (NeoVim 0.9+)

-- SEARCH SETTINGS
opt.hlsearch = true                  -- highlight found text
opt.incsearch = true                 -- highlight found on typing
opt.ignorecase = true                -- if a pattern contains an uppercase letter...
opt.smartcase = true                 -- ...search is case sensitive, otherwise, it is not

-- SPLIT SETTINGS
opt.splitright = true                -- new window on the right      (:vsplit file)
opt.splitbelow = true                -- new window below the current (:split  file)

-- OTHER SETTINGS
opt.mouse = 'a'                      -- enable mouse(disable: '')
opt.belloff = 'all'                  -- disable bell sound
opt.showmode = false                 -- mode is shown in status manually
opt.cursorline = true                -- highlight active line
opt.laststatus = 2                   -- always show statusline
opt.showcmd = true                   -- show commands at bottom right corner

-- MAKING SPACES VISIBLE AS INTERPUNCT
-- opt.list = true
-- opt.listchars = { space = '·' }

opt.keymap = 'russian-jcukenwin'
opt.iminsert = 0;
opt.imsearch = 0;

-- WRAP SETTINGS
opt.wrap = true                      -- show 1 long line as 2 or more lines
opt.whichwrap = '<,>,[,],h,l'        -- cycle lines (when press <Right> on last char, go to 1st char of next line)

-- CODE SYNTAX HIGHLIGHTING IN MARKDOWN
-- HTML, CSS, C, C++, C#, JavaScript, Python, Bash
g.markdown_fenced_languages = {
  'html', 'css',
  'c', 'cpp', 'cs',
  'javascript', 'python', 'bash'
};

 -- ENABLE 24-BIT COLORS
if vim.fn.has('termguicolors') then
  opt.termguicolors = true
end

-- RELATIVE NUMBERS VISUAL MODE ONLY
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = {
    '*:[vV\x16]*', '[vV\x16]*:*'
  },
  callback = function()
    -- wo = window options
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
  end,
})

-- (TODO: SHOW MODE HERE) filename[modified] encoding[line ending], line:column percentage
-- vim.o.statusline = '%f%m %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %= %l:%c %p%%'

-- SETTING INDENTS
set_indent_for(1, {
  '*.txt', '*.md'
});
set_indent_for(2, {
  '*.sh', '*.bashrc',
  '*.hs', '*.lua', '*.pas',
  '*.html', '*.css', '*.json',
  '*.js', '*.jsx', '*.ts', '*.tsx', '*.php'
});
set_indent_for(4, {
  '*.c', '*.cpp', '*.cs', '*.java'
});
