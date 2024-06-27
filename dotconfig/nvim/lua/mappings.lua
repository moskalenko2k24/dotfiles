local map = require('utils').map

-- IMPORTANT NORMAL MODE MAPPINGS
vim.g.mapleader = ',';                        -- <Leader> key = ,
map('n', ';', ':');                           -- ; =  : (typing : without shift)
map('n', 'Y', 'y$');                          -- Y = y$ (copy till end of line)
map('n', '<C-s>', ':w<CR>');                  -- Ctrl + s = save
map('n', '<C-q>', ':q<CR>');                  -- Ctrl + q = quit
map('n', '<Leader>h', ':nohlsearch<CR>');     -- , + h = remove search highlighting
map('n', '<Leader>l', 'i<Space><Esc>');       -- , + l = add space without leaving normal mode
map('n', '<Leader>m', 'i<CR><Esc>');          -- , + m = add empty line
map('n', '<Leader><Enter>', 'i<CR><Esc>');    -- , + Enter = add empty line
map('n', '<Space>', 'za');                    -- Space = open / close(toggle) fold
-- , + ; = add semicolon to the end of line
-- , + . = add dot to the end of line
local appendDot = 'mPA.<Esc>`P:delmarks P<CR>';
local appendComa = 'mPA,<Esc>`P:delmarks P<CR>';
local appendSemicolon = 'mPA;<Esc>`P:delmarks P<CR>';
map('n', '<Leader>.', appendDot, { silent = true });
map('n', '<Leader>,', appendComa, { silent = true });
map('n', '<Leader>;', appendSemicolon, { silent = true });

-- GO UP / DOWN VISUAL LINES
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

-- QUICKLY OPEN CONFIGS
-- F2 = NeoVim, F3 = Vim
map('n', '<F2>', ':e ~/.config/nvim/lua/<CR>');
map('n', '<F3>', ':e ~/.vimrc<CR>');
map('n', '<F5>', ':luafile ~/.config/nvim/init.lua<CR>');

-- IMPORTANT INSERT MODE MAPPINGS
map('i', '<C-BS>', '<C-w>');
map('i', '<C-ц>', '<C-w>');                   -- Ctrl + w, cyrillic
map('i', '<C-з>', '<C-p>');                   -- Ctrl + p, cyryllic

map('i', '<C-z>', '<Esc>ua');                 -- Ctrl + z = undo
map('i', '<C-я>', '<Esc>ua');                 -- Ctrl + z = undo, cyrillic

map('i', '<C-q>', '<Esc>:q<CR>');             -- Ctrl + q = quit
map('i', '<C-й>', '<Esc>:q<CR>');             -- Ctrl + q = quit, cyrillic

map('i', '<C-s>', '<Esc>:w<CR>a');            -- Ctrl + s = save, cyrillic
map('i', '<C-ы>', '<Esc>:w<CR>a');            -- Ctrl + s = save, cyrillic
map('i', '<C-і>', '<Esc>:w<CR>a');            -- Ctrl + s = save, cyrillic

map('i', '<C-v>', '<Esc>pa');                 -- Ctrl + v = paste
map('i', '<C-м>', '<Esc>pa');                 -- Ctrl + v = paste, cyryllic

map('i', '<C-f>', '<Esc>/');                  -- Ctrl + f = find
map('i', '<C-а>', '<Esc>/');                  -- Ctrl + f = find, cyryllic

map('i', '<C-d>', '<Delete>');                -- Ctrl + d = delete char
map('i', '<C-в>', '<Delete>');                -- Ctrl + d = delete char, cyryllic

-- WORK WITH TABS AND WINDOWS
map('n', '<Leader>s', ':split<CR>');          -- , + s = make horizontal split (with same file)
map('n', '<Leader>v', ':vsplit<CR>');         -- , + v = make vertical split (with same file)
map('n', '<Leader>t', ':tab split<CR>');      -- , + t = make tab (with same file & same position)
map('n', '<Leader>q', ':q<CR>');              -- , + q = close tab / window
map('n', '<C-l>', '<C-w>l');                  -- Ctrl + l = go right window
map('n', '<C-h>', '<C-w>h');                  -- Ctrl + h = go left window
map('n', '<C-j>', '<C-w>j');                  -- Ctrl + j = go down window
map('n', '<C-k>', '<C-w>k');                  -- Ctrl + k = go up window
-- https://superuser.com/questions/770068/in-vim-how-can-i-remap-tab-without-also-remapping-ctrli
map('n', '<C-i>', '<C-i>');                   -- map Tab, but keep Ctrl + i working
map('n', '<Tab>', '<C-w><C-w>');              -- Tab = switch windows
map('n', '<C-Left>', 'gt');                   -- Ctrl + Left = go next tab
map('n', '<C-Right>', 'gT');                  -- Ctrl + Right = go prev tab
map('n', '<C-Tab>', 'gt');                    -- Ctrl + Left = go next tab
map('n', '<C-S-Tab>', 'gT');                  -- Ctrl + Right = go prev tab
map('n', 'gy', 'gT');                         -- gt = next, gy = previous tab

-- ENABLE C-hjkl IN INSERT MODE
map('i', '<C-k>', '<Up>');
map('i', '<C-j>', '<Down>');
map('i', '<C-l>', '<Right>');

-- MAPPINGS FOR VIMDIFF
if vim.api.nvim_get_option_value('diff', {}) then
  map('n', 'q', ':qa<CR>');
  map('n', '<Leader>q', ':qa<CR>');
  map('n', '<C-q>', ':qa<CR>');
end

-- MAPPINGS FOR HELP WINDOWS
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function(event)
    -- vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<Cmd>close<CR>', { buffer = event.buf, silent = true })
  end
})
