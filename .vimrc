" This .vimrc uses junegunn/vim-plug
" Installing vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" MAIN SETTINGS
syntax on                        " syntax highlighting
set nocompatible                 " no compatible with Vi
set number                       " show line numbers
set hidden                       " enable closing buffers with unsaved changes
set clipboard=unnamedplus        " use system clipboard (Linux)
set encoding=utf-8               " default encoding
set fileencodings=utf-8,cp1251   " automatically detected encodings
set swapfile                     " enable saving swap files (backup if editor crashes)
set directory=~/.vim/swapfiles// " path for swap files
set termguicolors                " enable 24-bit colors(some plugins need)

" GUI SETTINGS
if has("gui_running")
    set guioptions -=T           " hide toolbar in gvim
    set guioptions -=m           " hide menu in gvim
    set guifont=JetBrainsMono\ 12
endif

" INDENT SETTINGS
set autoindent                   " autoindent
set smartindent
set expandtab                    " use spaces instead of tabs
set tabstop=4                    " set   tab width to 4 spaces
set shiftwidth=4                 " set shift width to 4 spaces

" SEARCH SETTINGS
set hlsearch                     " highlight found text
set incsearch                    " highlight found on typing
set ignorecase                   " if a pattern contains an uppercase letter,
set smartcase                    " search is case sensitive, otherwise, it is not

" SPLIT SETTINGS
set splitright                   " new window on the right      (:vsplit file)
set splitbelow                   " new window below the current (:split  file)

" OTHER SETTINGS
set mouse=a                      " enable mouse(disable: mouse=)
set belloff=all                  " disable bell sound
set noshowmode                   " mode is shown in status manually
set cursorline                   " highlight active line
set laststatus=2                 " always show statusline

" WRAP SETTINGS
set wrap                         " show 1 long line as 2 or more lines
set whichwrap=<,>,[,],h,l        " cycle lines (when press <Right> on last char, go to 1st char of next line)

" CODE SYNTAX HIGHLIGHTING IN MARKDOWN
" HTML, CSS, C, C++, C#, JavaScript, Python, Bash
let g:markdown_fenced_languages = [
            \ 'html', 'css',
            \ 'c', 'cpp', 'cs',
            \ 'javascript', 'python', 'bash']

" HOT RELOAD OF .vimrc CONFIG
" (load new config on save)
au BufWritePost  ~/.vimrc :source ~/.vimrc

" GO TO NORMAL MODE MAPPINGS
inoremap <C-i> <Tab>
inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>

" IMPORTANT INSERT MODE MAPPINGS
" Ctrl + z, s, v, f, q
" (undo, save, paste, find, quit)
inoremap <C-z> <Esc>ua
inoremap <C-v> <Esc>pa
inoremap <C-f> <Esc>/
inoremap <C-s> <Esc>:w<CR>a
inoremap <C-q> <Esc>:q<CR>
" Autocompletion on Ctrl-Space
inoremap <C-Space> <C-p>
" Moving with jkl
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
" inoremap <C-h> <Left>

" IMPORTANT NORMAL MODE MAPPINGS
" <Leader> key = ,
let mapleader = ","
" Type : without shift
nnoremap ; :
nnoremap Y y$
" Ctrl + s(ave), q(uit)
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
"    , + h = remove search highlighting
nnoremap <Leader>h :nohlsearch<CR>
"    , + l = add space without leaving normal mode
nnoremap <Leader>l i<Space><Esc>
"    , + BS = add empty line
nnoremap <Leader><BS> i<CR><Esc>
"    , + r = add empty line
nnoremap <Leader>r i<CR><Esc>
" Quickly open Vim config
nnoremap <F2> :e ~/.vimrc<CR>
nnoremap <F3> :e ~/.config/nvim/init.lua<CR>
" on up / down move to visual, not logical line
nnoremap k gk
nnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <Esc>gka
inoremap <Down> <Esc>gja

" WORK WITH TABS AND WINDOWS
" , + s = make horizontal split (with same file)
nnoremap <Leader>s :split<CR>
" , + v = make vertical split (with same file)
nnoremap <Leader>v :vsplit<CR>
" , + t = make tab (with same file)
nnoremap <Leader>t :tabe %<CR>
" , + q = close tab / window
nnoremap <Leader>q :q<CR>
" Ctrl + h / l = go left / right window
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Ctrl + j / k = go down / up window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" Ctrl + Left / Right = go prev / next tab
nnoremap <C-Left> gT
nnoremap <C-Right> gt

" 0 = go to ^
" or go to 0 (if we are at ^)
" https://vi.stackexchange.com/questions/35057/double-press-override-for-0-key
nnoremap <expr> 0 virtcol('.') == indent('.')+1 ? '0' : '^'
xnoremap <expr> 0 virtcol('.') == indent('.')+1 ? '0' : '^'
onoremap <expr> 0 virtcol('.') == indent('.')+1 ? '0' : '^'

autocmd BufNewFile *.c 0r ~/Templates/C/main.c
autocmd BufNewFile *.cpp 0r ~/Templates/C++/main.cpp
autocmd BufNewFile *.pas 0r ~/Templates/Free_Pascal/program.pas
autocmd BufNewFile *.java 0r ~/Templates/Java/Program.java
autocmd BufNewFile *.py 0r ~/Templates/Python/main.py
autocmd BufNewFile *.js 0r ~/Templates/JavaScript/index.js
autocmd BufNewFile *.html 0r ~/Templates/index.html

autocmd BufRead,BufNewFile *.pas set tabstop=2 shiftwidth=2

" STATUSLINE
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

" RUSSIAN LANGUAGE
set langremap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim', { 'branch': 'main' }
Plug 'mkitt/tabline.vim'

Plug 'tpope/vim-afterimage'

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

" Showing marks
Plug 'kshenoy/vim-signature'

" Auto-closing tags
" Plug 'alvan/vim-closetag'
" let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.js,*.ts'
" let g:closetag_shortcut = '</'

" Simple commenting
" (un)comment - gcc
Plug 'tyru/caw.vim'
" inoremap <C-/> <Esc>gcc<Esc>a

" Pasting with indentation
" adjusted to destination context
Plug 'sickill/vim-pasta'

" File tree plugin, Ctrl + N
" Plug 'preservim/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" nnoremap <C-n> :NERDTreeTabsToggle<CR>
" Ingore some directories
" let g:NERDTreeIgnore = ['^node_modules$']
" Don't run on startup
" let g:nerdtree_tabs_open_on_gui_startup = 0
" let g:nerdtree_tabs_open_on_console_startup = 0

" Show as file tree
" let g:netrw_liststyle = 3

" Plugin which finds project root
" Plug 'airblade/vim-rooter'
" let g:rooter_manual_only = 0
" let g:rooter_change_directory_for_non_project_files = ''
" let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

function! ListFiles()
    let status = system("git status")
    if v:shell_error
        Files
    else
        GFiles
    endif
endfunction

" File navigation plugin, Ctrl + P
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" inoremap <C-p> <Esc>:call ListFiles()<CR>
nnoremap <Leader>/ :Rg<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap б. :Rg<CR>
nnoremap ба :Files<CR>
nnoremap бпа :GFiles<CR>
nnoremap би :Buffers<CR>

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" TeX / LaTeX
Plug 'lervag/vimtex'
" Open compiled file in Zathura
" let g:vimtex_view_method = 'zathura'

" JS / TS (JSX highlighting)
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" Show colors(in CSS) like in VS Code
" Golang must be installed, sudo dnf install golang
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Markdown
" Preview in browser (requires yarn)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
let g:mkdp_page_title = '${name}.md'
nnoremap <Leader>m :MarkdownPreview<CR>

" Formatting tables automatically
" use '<Leader>tm' to enter table mode
" https://github.com/dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode'

" LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" nmap <Leader>rn <Plug>(coc-rename)
" Plug 'OmniSharp/omnisharp-vim'

call plug#end()

" ENABLE THEME
colorscheme onedark
