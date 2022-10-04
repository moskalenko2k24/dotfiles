local opt = vim.opt     -- options
local cmd = vim.cmd     -- execute Vim commands
local global = vim.g
local map = require("utils").map

-- Main settings
-- syntax on                       -- syntax highlighting
opt.number = true                  -- line numbers
opt.clipboard = 'unnamedplus'      -- use system clipboard (Linux)
opt.encoding = 'utf-8'             -- default encoding
opt.fileencodings = 'utf-8,cp1251' -- automatically detected encodings

-- Indent settings
opt.autoindent = true   -- auto indent
opt.expandtab = true    -- use spaces instead of tabs
opt.tabstop = 4         -- set   tab width to 4 spaces
opt.shiftwidth = 4      -- set shift width to 4 spaces

-- Search settings
opt.hlsearch = true     -- highlight found text
opt.incsearch = true    -- highlight found on typing

-- Split settings
opt.splitright = true   -- new window on the right      (:vsplit file)
opt.splitbelow = true   -- new window below the current (:split  file)

-- Other settings
opt.mouse = 'a'         -- enable mouse(disable: '')
opt.belloff = 'all'     -- disable bell sound
-- opt.showmode = false    -- mode is shown in status manually
opt.showmode = true 
opt.wrap = true         -- wrap long lines
opt.cursorline = true   -- highlight active line
opt.laststatus = 2      -- always show statusline

-- Wrap settings
-- go to next line after last character
opt.whichwrap = '<,>,[,],h,l'

-- Enable colorscheme & syntax highlight
cmd 'syntax on'
cmd 'colorscheme onedark'

global.mapleader = ','

map('n', ';', ':')
map("n", "<Leader>h", ":nohlsearch<CR>", { silent = true })
map("n", "<Leader>s", ":split<CR>")
map("n", "<Leader>v", ":vsplit<CR>")
map("n", "<Leader>t", ":tabe %<CR>")

map('n', '<C-q>', ':q<CR>')
map('n', '<C-s>', ':w<CR>')

-- useful mapping for insert mode
map('i', '<C-z>', '<Esc>ua')      -- Ctrl + z = undo
map('i', '<C-q>', '<Esc>:q<CR>')  -- Ctrl + q = quit
map('i', '<C-s>', '<Esc>:w<CR>a') -- Ctrl + s = save
map('i', '<C-v>', '<Esc>pa')      -- Ctrl + v = paste
map('i', '<C-f>', '<Esc>/')       -- Ctrl + f = find

-- moving in visual lines
-- (if one line is visually like two or more lines)
map('n', 'k', 'gk')
map('n', 'j', 'gj')
