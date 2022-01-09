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
set hlsearch          " highlight found text
set incsearch         " highlight found on typing 
set laststatus=2      " always show statusline

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

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
set statusline+=%f
set statusline+=%m
" encoding[line ending format]
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
" right align for rest info
set statusline+=%=
" position: 'line:column percentage'
set statusline+=%l:%c\ %p%%

" statusline with airline plugin
" let g:airline_section_z='%l:%c %p%%'

" Setting statusline end

" Enable color scheme
packadd! onedark.vim
colorscheme onedark

" Open compiled (La)TeX file in Zathura
let g:vimtex_view_method = 'zathura'

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'             " File Tree
Plug 'lervag/vimtex'                  " TeX / LaTeX
Plug 'editorconfig/editorconfig-vim'  " EditorConfig
Plug 'OmniSharp/omnisharp-vim'        " .NET
" Plug 'vim-airline/vim-airline'      " Better statusline
call plug#end()

" Open file tree on Ctrl + N
nnoremap <C-n> :NERDTreeToggle<CR>

set omnifunc=syntaxcomplete#Complete
