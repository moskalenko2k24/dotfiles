local opt = vim.opt     -- options
local cmd = vim.cmd     -- execute Vim commands

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
opt.mouse = ''          -- disable mouse(enable: mouse = 'a')
opt.belloff = 'all'     -- disable bell sound
opt.showmode = false    -- mode is shown in status manually
opt.wrap = false        -- do not wrap lines
opt.cursorline = true   -- highlight active line
opt.laststatus = 2      -- always show statusline

-- Enable colorscheme & syntax highlight
cmd 'syntax on'
--cmd 'colorscheme onedark'
