local map = require("utils").map

-- Important normal mode mappings
vim.g.mapleader = ',';                        -- <Leader> key = ,
map('n', ';', ':');                           -- ; =  : (typing : without shift)
map('n', 'Y', 'y$');                          -- Y = y$ (copy till end of line)
map('n', '<C-s>', ':w<CR>');                  -- Ctrl + s = save
map('n', '<C-q>', ':q<CR>');                  -- Ctrl + q = quit
map("n", "<Leader>h", ":nohlsearch<CR>");     -- , + h = remove search highlighting
map('n', '<Leader>l', 'i<Space><Esc>');       -- , + l = add space without leaving normal mode
map('n', '<Leader><Enter>', 'i<CR><Esc>');    -- , + Enter = add empty line
-- , + ; = add semicolon to the end of line
local appendSemicolon = 'mPA;<Esc>`P:delmarks P<CR>';
map('n', '<Leader>;', appendSemicolon, { silent = true });
-- map('n', 'C-i', '\x1b[105;5u');

-- Go up / down visual lines
-- (line with breaks looks like 2 or more line)
map('n', 'k', 'gk');                          -- k =   Up, normal mode
map('n', 'j', 'gj');                          -- j = Down, normal mode
map('v', 'k', 'gk');                          -- k =   Up, visual mode
map('v', 'j', 'gj');                          -- j = Down, visual mode
map('n', '<Up>', 'gk');                       -- Up, normal mode
map('n', '<Down>', 'gj');                     -- Down, normal mode
map('v', '<Up>', 'gk');                       -- Up, visual mode
map('v', '<Down>', 'gj');                     -- Down, visual mode
map('i', '<Up>', '<Esc>gka');                 -- Up, insert mode
map('i', '<Down>', '<Esc>gja');               -- Down, insert mode

-- Quickly open configs
-- F2 = NeoVim, F3 = Vim
map('n', '<F2>', ':e ~/.config/nvim/lua/<CR>');
map('n', '<F3>', ':e ~/.vimrc<CR>');
map('n', '<F5>', ':luafile ~/.config/nvim/init.lua<CR>');

-- Important insert mode mappings
map('i', '<C-z>', '<Esc>ua');                 -- Ctrl + z = undo
map('i', '<C-q>', '<Esc>:q<CR>');             -- Ctrl + q = quit
map('i', '<C-s>', '<Esc>:w<CR>a');            -- Ctrl + s = save
map('i', '<C-v>', '<Esc>pa');                 -- Ctrl + v = paste
map('i', '<C-f>', '<Esc>/');                  -- Ctrl + f = find

-- Work with tabs and windows
map('n', '<Leader>s', ':split<CR>');          -- , + s = make horizontal split (with same file)
map('n', '<Leader>v', ':vsplit<CR>');         -- , + v = make vertical split (with same file)
map('n', '<Leader>t', ':tab split<CR>');      -- , + t = make tab (with same file & same position)
map('n', '<Leader>q', ':q<CR>');              -- , + q = close tab / window
map('n', '<C-l>', '<C-w>l');                  -- Ctrl + l = go right window
map('n', '<C-h>', '<C-w>h');                  -- Ctrl + h = go left window
map('n', '<C-j>', '<C-w>j');                  -- Ctrl + j = go down window
map('n', '<C-k>', '<C-w>k');                  -- Ctrl + k = go up window
map('n', '<Tab>', '<C-w><C-w>');              -- Tab = switch windows
map('n', '<C-Left>', 'gt');                   -- Ctrl + Left = go next tab
map('n', '<C-Right>', 'gT');                  -- Ctrl + Right = go prev tab
map('n', '<C-Tab>', 'gt');                    -- Ctrl + Left = go next tab
map('n', '<C-S-Tab>', 'gT');                  -- Ctrl + Right = go prev tab

-- Enable C-hjkl in insert mode
map('i', '<C-k>', '<Up>');
map('i', '<C-j>', '<Down>');
map('i', '<C-l>', '<Right>');
