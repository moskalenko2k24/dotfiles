" Complete .vimrc with plugins,
" uses vim-plug (https://github.com/junegunn/vim-plug)

syntax on             " syntax highlighting
set number            " line numbers
set clipboard=unnamedplus      " use system clipboard (Linux)
set encoding=utf-8             " default encoding
set fileencodings=utf-8,cp1251 " automatically detected encodings

set autoindent        " autoindent
set expandtab         " use spaces instead of tabs
set tabstop=4         " set   tab width to 4 spaces
set shiftwidth=4      " set shift width to 4 spaces

set mouse=            " disable mouse(enable: mouse=a)
set belloff=all       " disable bell sound
set noshowmode        " mode is shown in status manually
set nowrap            " do not wrap lines
set splitright        " new window on the right      (:vsplit <file>)
set splitbelow        " new window below the current (:split  <file>)
set cursorline        " highlight active line
set laststatus=2      " always show statusline
" Search settings
set hlsearch          " highlight found text
set incsearch         " highlight found on typing 

" Setting statusline begin

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

" Setting statusline end

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim', { 'branch': 'main' }

" Automatic keyboard layout switching 
Plug 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
" Use this on Fedora + GNOME
" git clone https://github.com/lyokha/g3kb-switch
" cd g3kb-switch
" mkdir build && cd build
" cmake -DCMAKE_BUILD_TYPE=Release -DG3KBSWITCH_WITH_GNOME_SHELL_EXTENSION=ON ..
" make
" sudo make install
" sudo dnf install gnome-extensions-app (GUI app!),
" then enable G3kbSwitch in Extensions app (restart can be required before)

" Auto Pairs (auto insert brackets)
Plug 'jiangmiao/auto-pairs'

" File tree
Plug 'preservim/nerdtree'
" Open file tree with Ctrl + N
nnoremap <C-n> :NERDTreeToggle<CR>

" File navigation plugin
Plug 'ctrlpvim/ctrlp.vim'

" Another file navigation plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" TeX / LaTeX
Plug 'lervag/vimtex'                  " TeX / LaTeX
" Open compiled (La)TeX file in Zathura
let g:vimtex_view_method = 'zathura'

" JSX highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'skanehira/preview-markdown.vim'

" Some unused plugins

" .NET autocomplete
" Plug 'OmniSharp/omnisharp-vim'
" set omnifunc=syntaxcomplete#Complete


" Autocomplete for pupular languages
" Plug 'ycm-core/YouCompleteMe'

" Plug 'vim-airline/vim-airline'      " Better statusline
" let g:airline_section_z='%l:%c %p%%'

call plug#end()

" Enable theme
colorscheme onedark
