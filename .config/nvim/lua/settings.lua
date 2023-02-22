local opt = vim.opt     -- options
local cmd = vim.cmd     -- execute Vim commands
local global = vim.g
local autocmd = vim.api.nvim_create_autocmd

-- MAIN SETTINGS
cmd 'syntax on'                      -- syntax highlighting
opt.compatible = false               -- no compatible with Vi
opt.number = true                    -- show line numbers
opt.relativenumber = false           -- (don't) show relative numbers
opt.hidden = true                    -- enable closing buffers with unsaved changes
opt.clipboard = 'unnamedplus'        -- use system clipboard (Linux)
opt.encoding = 'utf-8'               -- default encoding
opt.fileencodings = 'utf-8,cp1251'   -- automatically detected encodings
opt.swapfile = true                  -- enable saving swap files (backup if editor crashes)
--opt.directory = '~/.vim/swapfiles//' -- path for swap files
opt.termguicolors = true             -- enable 24-bit colors(some plugins need)

-- INDENT SETTINGS
opt.autoindent = true                -- autoindent
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
opt.showmode = false                 -- mode is shown in status manually
opt.cursorline = true                -- highlight active line
opt.laststatus = 2                   -- always show statusline
opt.showcmd = true                   -- show commands at bottom right corner

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

-- RELATIVE NUMBERS VISUAL MODE ONLY
autocmd('ModeChanged', {
  pattern = {
    '*:[vV\x16]*', '[vV\x16]*:*'
  },
  callback = function()
    -- wo = window options
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
  end,
})
