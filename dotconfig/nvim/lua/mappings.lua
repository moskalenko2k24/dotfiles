local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local function nmap(lhs , rhs, opts) map('n', lhs, rhs, opts); end
local function imap(lhs , rhs, opts) map('i', lhs, rhs, opts); end
local function vmap(lhs , rhs, opts) map('v', lhs, rhs, opts); end

vim.g.mapleader = ',';                    -- <Leader> key = ,
vmap('<Leader>y', '"ty:tabedit<CR>"tp');  -- open selected text in new tab

-- IMPORTANT NORMAL MODE MAPPINGS
nmap(';', ':');                           -- ; =  : (typing : without shift)
nmap('Y', 'y$');                          -- Y = y$ (copy till end of line)
nmap('<C-s>', ':w<CR>');                  -- Ctrl + s = save
nmap('<C-q>', ':q<CR>');                  -- Ctrl + q = quit
nmap('<Leader>h', ':nohlsearch<CR>');     -- , + h = remove search highlighting
nmap('<Leader>l', 'i<Space><Esc>');       -- , + l = add space without leaving normal mode
nmap('<Leader>m', 'i<CR><Esc>');          -- , + m = add empty line
nmap('<Leader><Enter>', 'i<CR><Esc>');    -- , + Enter = add empty line
nmap('<Leader>z', ':stop<CR>');           -- , + z = suspend (fg to return to NeoVim)
nmap('<Space>', 'za');                    -- Space = open / close(toggle) fold

local append = function (char)
  return 'mP' ..                          -- remember position creating mark
         'A' .. char .. '<Esc>' ..        -- append character (insert mode), go normal mode
         '`P' .. ':delmarks P<CR>';       -- go to remembered position, remove mark
end
nmap('<Leader>.', append('.'));           -- , + . = append .
nmap('<Leader>,', append(','));           -- , + , = append ,
nmap('<Leader>;', append(';'));           -- , + ; = append ;
nmap('<Leader>\\', append(' \\'));        -- , + \ = append \

-- GO UP / DOWN VISUAL LINES
-- (line with breaks looks like 2 or more line)
nmap('k', 'gk');                          -- k =   Up, normal mode
nmap('j', 'gj');                          -- j = Down, normal mode
vmap('k', 'gk');                          -- k =   Up, visual mode
vmap('j', 'gj');                          -- j = Down, visual mode
nmap('<Up>', 'gk');                       -- Up, normal mode
nmap('<Down>', 'gj');                     -- Down, normal mode
vmap('<Up>', 'gk');                       -- Up, visual mode
vmap('<Down>', 'gj');                     -- Down, visual mode
imap('<Up>', '<Esc>gka');                 -- Up, insert mode
imap('<Down>', '<Esc>gja');               -- Down, insert mode

-- QUICKLY OPEN CONFIGS
-- F2 = NeoVim, F3 = Vim
nmap('<F2>', ':e ~/.config/nvim/lua/<CR>');
nmap('<F3>', ':e ~/.vimrc<CR>');
nmap('<F5>', ':luafile ~/.config/nvim/init.lua<CR>');

-- IMPORTANT INSERT MODE MAPPINGS
imap('<C-BS>', '<C-w>');                  -- doesn't work :(
imap('<C-к>',  '<C-r>');                  -- Ctrl + r, cyrillic
imap('<C-ц>', '<C-w>');                   -- Ctrl + w, cyrillic
imap('<C-з>', '<C-p>');                   -- Ctrl + p, cyryllic
imap('<C-г>', '<C-u>');                   -- Ctrl + u, cyryllic

imap('<C-z>', '<Esc>ua');                 -- Ctrl + z = undo
imap('<C-я>', '<Esc>ua');                 -- Ctrl + z = undo, cyrillic

imap('<C-q>', '<Esc>:q<CR>');             -- Ctrl + q = quit
imap('<C-й>', '<Esc>:q<CR>');             -- Ctrl + q = quit, cyrillic

imap('<C-s>', '<Esc>:w<CR>a');            -- Ctrl + s = save, cyrillic
imap('<C-ы>', '<Esc>:w<CR>a');            -- Ctrl + s = save, cyrillic
imap('<C-і>', '<Esc>:w<CR>a');            -- Ctrl + s = save, cyrillic

-- imap('<C-v>', '<Esc>pa');                 -- Ctrl + v = paste
-- imap('<C-м>', '<Esc>pa');                 -- Ctrl + v = paste, cyryllic
-- <BS>

imap('<C-f>', '<Esc>/');                  -- Ctrl + f = find
imap('<C-а>', '<Esc>/');                  -- Ctrl + f = find, cyryllic

imap('<C-d>', '<Delete>');                -- Ctrl + d = delete char
imap('<C-в>', '<Delete>');                -- Ctrl + d = delete char, cyryllic

-- WORK WITH TABS AND WINDOWS
nmap('<Leader>s', ':split<CR>');          -- , + s = make horizontal split (with same file)
nmap('<Leader>v', ':vsplit<CR>');         -- , + v = make vertical split (with same file)
nmap('<Leader>t', ':tab split<CR>');      -- , + t = make tab (with same file & same position)
nmap('<Leader>q', ':q<CR>');              -- , + q = close tab / window
nmap('<C-l>', '<C-w>l');                  -- Ctrl + l = go right window
nmap('<C-h>', '<C-w>h');                  -- Ctrl + h = go left window
nmap('<C-j>', '<C-w>j');                  -- Ctrl + j = go down window
nmap('<C-k>', '<C-w>k');                  -- Ctrl + k = go up window
-- https://superuser.com/questions/770068/in-vim-how-can-i-remap-tab-without-also-remapping-ctrli
nmap('<C-i>', '<C-i>');                   -- map Tab, but keep Ctrl + i working
nmap('<Tab>', '<C-w><C-w>');              -- Tab = switch windows
nmap('<C-Left>', 'gt');                   -- Ctrl + Left = go next tab
nmap('<C-Right>', 'gT');                  -- Ctrl + Right = go prev tab
nmap('<C-Tab>', 'gt');                    -- Ctrl + Left = go next tab
nmap('<C-S-Tab>', 'gT');                  -- Ctrl + Right = go prev tab
nmap('gy', 'gT');                         -- gt = next, gy = previous tab



-- ENABLE C-hjkl IN INSERT MODE, C-b AS BACKSPACE
imap('<C-h>', '<Left>');
imap('<C-р>', '<Left>');
imap('<C-k>', '<Up>');
imap('<C-л>', '<Up>');
imap('<C-j>', '<Down>');
imap('<C-о>', '<Down>');
imap('<C-l>', '<Right>');
imap('<C-д>', '<Right>');
imap('<C-b>', '<BS>');
imap('<C-и>', '<BS>');

-- MAPPINGS FOR VIMDIFF
if vim.api.nvim_get_option_value('diff', {}) then
  nmap('q', ':qa<CR>');
  nmap('<Leader>q', ':qa<CR>');
  nmap('<C-q>', ':qa<CR>');
end

-- MAPPINGS FOR HELP WINDOWS
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function(event)
    -- vim.bo[event.buf].buflisted = false
    nmap('q', '<Cmd>close<CR>', { buffer = event.buf, silent = true })
  end
})
