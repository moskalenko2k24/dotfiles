local opt = vim.opt     -- options
local cmd = vim.cmd     -- execute Vim commands
local global = vim.g
local map = require("utils").map

-- MAIN SETTINGS
cmd 'syntax on'                      -- syntax highlighting
opt.compatible = false               -- no compatible with Vi
opt.number = true                    -- show line numbers
opt.relativenumber = true            -- show relative numbers
opt.hidden = true                    -- enable closing buffers with unsaved changes
opt.clipboard = 'unnamedplus'        -- use system clipboard (Linux)
opt.encoding = 'utf-8'               -- default encoding
opt.fileencodings = 'utf-8,cp1251'   -- automatically detected encodings
opt.swapfile = true                  -- enable saving swap files (backup if editor crashes)
opt.directory = '~/.vim/swapfiles//' -- path for swap files

-- INDENT SETTINGS
opt.autoindent = true                -- autoindent
opt.smartindent = true
opt.expandtab = true                 -- use spaces instead of tabs
opt.tabstop = 4                      -- set   tab width to 4 spaces
opt.shiftwidth = 4                   -- set shift width to 4 spaces

-- SEARCH SETTINGS
opt.hlsearch = true                  -- highlight found text
opt.incsearch = true                 -- highlight found on typing
opt.ignorecase = true                -- if a pattern contains an uppercase letter,
opt.smartcase = true                 -- search is case sensitive, otherwise, it is not

-- SPLIT SETTINGS
opt.splitright = true                -- new window on the right      (:vsplit file)
opt.splitbelow = true                -- new window below the current (:split  file)

-- OTHER SETTINGS
opt.mouse = 'a'                      -- enable mouse(disable: '')
opt.belloff = 'all'                  -- disable bell sound
-- opt.showmode = false              -- mode is shown in status manually
opt.showmode = true 
opt.cursorline = true                -- highlight active line
opt.laststatus = 2                   -- always show statusline

-- WRAP SETTINGS
opt.wrap = true                      -- show 1 long line as 2 or more lines
opt.whichwrap = '<,>,[,],h,l'        -- cycle lines (when press <Right> on last char, go to 1st char of next line)

-- CODE SYNTAX HIGHLIGHTING IN MARKDOWN
-- HTML, CSS, C, C++, C#, JavaScript, Python, Bash
global.markdown_fenced_languages = {
    'html', 'css',
    'c', 'cpp', 'cs',
    'javascript', 'python', 'bash'
};

-- HOT RELOAD OF init.lua
-- TO DO THIS!
-- au BufWritePost  ~/.vimrc :source ~/.vimrc

-- GO TO NORMAL MODE MAPPINGS (TO DO ?)
--inoremap <C-i> <Tab>
--inoremap <Tab> <Esc>
--vnoremap <Tab> <Esc

-- IMPORTANT INSERT MODE MAPPINGS
map('i', '<C-z>', '<Esc>ua')              -- Ctrl + z = undo
map('i', '<C-q>', '<Esc>:q<CR>')          -- Ctrl + q = quit
map('i', '<C-s>', '<Esc>:w<CR>a')         -- Ctrl + s = save
map('i', '<C-v>', '<Esc>pa')              -- Ctrl + v = paste
map('i', '<C-f>', '<Esc>/')               -- Ctrl + f = find

-- Autocomplete on C-Space
-- TO DO THIS!

-- IMPORTANT NORMAL MODE MAPPINGS
global.mapleader = ','                    -- <Leader> key = ,
map('n', ';', ':');                       -- ; =  : (typing : without shift)
map('n', 'Y', 'y$');                      -- Y = y$ (copy till end of line)
map('n', '<C-s>', ':w<CR>');              -- Ctrl + s = save
map('n', '<C-q>', ':q<CR>');              -- Ctrl + q = quit
map("n", "<Leader>h", ":nohlsearch<CR>")  -- , + h = remove search highlighting
map('n', '<Leader>l', 'i<Space><Esc>');   -- , + l = add space without leaving normal mode
map('n', '<Leader><BS>', 'i<CR><Esc>');   -- , + BackSpace = add empty line
map('n', 'k', 'gk');                      -- go   up visible line
map('n', 'j', 'gj');                      -- go down visible line

-- QUICKLY OPEN CONFIGS
-- F2 = NeoVim, F3 = Vim
map('n', '<F2>', ':e ~/.config/nvim/init.lua<CR>');
map('n', '<F3>', ':e ~/.vimrc<CR>');

-- WORK WITH TABS AND WINDOWS
map('n', '<Leader>s', ':split<CR>')       -- , + s = make horizontal split (with same file)
map('n', '<Leader>v', ':vsplit<CR>')      -- , + v = make vertical split (with same file)
map('n', '<Leader>t', ':tabe %<CR>')      -- , + t = make tab (with same file)
map('n', '<Leader>q', ':q<CR>')           -- , + q = close tab / window
map('n', '<C-l>', '<C-w>l')               -- Ctrl + l = go right window
map('n', '<C-h>', '<C-w>h')               -- Ctrl + h = go left window
map('n', '<C-j>', '<C-w>j')               -- Ctrl + j = go down window
map('n', '<C-k>', '<C-w>k')               -- Ctrl + k = go up window
map('n', '<C-Left>', 'gt')                -- Ctrl + Left = go next tab
map('n', '<C-Right>', 'gT')               -- Ctrl + Right = go prev tab

-- STATUSLINE
-- TO DO (SHOW MODE AT LEFT)
-- filename[modified] encoding[line ending], line:column percentage
vim.o.statusline = '%f%m %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %= %l:%c %p%%'

-- ENABLE THEME
cmd 'colorscheme onedark'
