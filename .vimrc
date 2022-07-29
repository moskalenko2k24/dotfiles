" This .vimrc uses junegunn/vim-plug 
" Installing vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Main settings
syntax on                      " syntax highlighting
set number                     " line numbers
set clipboard=unnamedplus      " use system clipboard (Linux)
set encoding=utf-8             " default encoding
set fileencodings=utf-8,cp1251 " automatically detected encodings
" set relativenumber           " show relative numbers

" Indent settings
set autoindent        " autoindent
set expandtab         " use spaces instead of tabs
set tabstop=4         " set   tab width to 4 spaces
set shiftwidth=4      " set shift width to 4 spaces

" Search settings
set hlsearch          " highlight found text
set incsearch         " highlight found on typing 

" Split settings
set splitright        " new window on the right      (:vsplit file)
set splitbelow        " new window below the current (:split  file)
 
" Other
set mouse=a           " enable mouse(disable: mouse=)
set belloff=all       " disable bell sound
set noshowmode        " mode is shown in status manually
set nowrap            " do not wrap lines
set cursorline        " highlight active line
set laststatus=2      " always show statusline
set whichwrap=<,>,[,],h,l " go to next line after last character

let g:markdown_fenced_languages = [
            \ 'html', 'css', 'javascript',
            \ 'c', 'cpp', 'cs', 'python']

autocmd BufNewFile *.c 0r ~/Templates/C/main.c
autocmd BufNewFile *.cpp 0r ~/Templates/C++/main.cpp
autocmd BufNewFile *.pas 0r ~/Templates/Free_Pascal/program.pas
autocmd BufNewFile *.java 0r ~/Templates/Java/Program.java
autocmd BufNewFile *.py 0r ~/Templates/Python/main.py
autocmd BufNewFile *.js 0r ~/Templates/JavaScript/index.js
autocmd BufNewFile *.html 0r ~/Templates/index.html

autocmd BufRead,BufNewFile *.pas set tabstop=2 shiftwidth=2

" My mappings
let mapleader = ","
" Ctrl + Z = undo
inoremap <C-z> <Esc>ua
" Ctrl + V = paste
inoremap <C-v> <Esc>pa
" Ctrl + S = save
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>
"    , + H = remove search highlighting
nnoremap <Leader>h :noh<CR>
"    , + S = split across two lines
nnoremap <Leader>s i<CR><Esc>
" Ctrl + Q = exit
inoremap <C-q> <Esc>:q<CR>
nnoremap <C-q> :q<CR>
" Ctrl + h / l = left / right window
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Ctrl + Arrow = prev / next tab
nnoremap <C-Left> gT
nnoremap <C-Right> gt
" Ctrl + PgUp   = prev tab
nnoremap <PageUp> gT
" Ctrl + PgDown = next tab
nnoremap <PageDown> gt

" Go to definition in js files using gd
autocmd FileType javascript nnoremap gd m':keepjumps normal!gd$Blgf<CR> :noh<CR>
autocmd FileType javascript nnoremap пв m':keepjumps normal!gd$Blgf<CR> :noh<CR>
" Simpler way to it (but not perfect)
" autocmd FileType javascript nnoremap gd gd/from<CR>:noh<CR>5lgf
" Open file in new tab
" autocmd FileType javascript nnoremap gd gd/from<CR>:noh<CR>5l<C-w>gf

" STATUSLINE begin
" MODE filename[modified] encoding[line ending], line:column percentage
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}
" clear statusline
set statusline=
" mode (insert, normal etc.)
set statusline+=\ %{toupper(g:currentmode[mode()])}
" filename[modified flag]
set statusline+=%f%m
" encoding[line ending format]
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
" right align for rest info
set statusline+=%=
" position: 'line:column percentage'
set statusline+=%l:%c\ %p%%
" STATUSLINE end

" Hot reload of .vimrc config
" (load new config on save)
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Russian language
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim', { 'branch': 'main' }

" Automatic keyboard layout switching 
Plug 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
" Use this on GNOME
" sudo dnf install glib2-devel
" git clone https://github.com/lyokha/g3kb-switch
" cd g3kb-switch
" mkdir build && cd build
" cmake -DCMAKE_BUILD_TYPE=Release -DG3KBSWITCH_WITH_GNOME_SHELL_EXTENSION=ON ..
" make
" sudo make install
" cd ../extension
" make install  # no sudo requred!
" sudo dnf install gnome-extensions-app (GUI app!),
" then enable G3kbSwitch in Extensions app (restart can be required before)

" Auto Pairs (auto insert brackets)
Plug 'jiangmiao/auto-pairs'

" Easily delete, change and add surroundings
" cs'" = 'text' -> "text"
"   S) =   text -> (text)
Plug 'tpope/vim-surround'

" Simple commenting
" (un)comment - gcc
Plug 'tyru/caw.vim'

" Pasting with with indentation
" adjusted to destination context
Plug 'sickill/vim-pasta'

" File tree plugin, Ctrl + N
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
nnoremap <C-n> :NERDTreeTabsToggle<CR>
" Ingore some directories
let g:NERDTreeIgnore = ['^node_modules$']

" File navigation plugin, Ctrl + P
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :GFiles<CR>

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" TeX / LaTeX
Plug 'lervag/vimtex'
" Open compiled file in Zathura
let g:vimtex_view_method = 'zathura'

" JS / TS (JSX highlighting)
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" Markdown
" Preview in browser (requires yarn)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
let g:mkdp_page_title = '${name}.md'

" Formatting tables automatically
" use '<Leader>tm' to enter table mode
Plug 'dhruvasagar/vim-table-mode'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Enable theme
colorscheme onedark
