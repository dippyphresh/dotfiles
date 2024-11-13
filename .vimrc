" Options
set encoding=utf8
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
"set cc=100 " Show at 80 column a border for good code style 
set guifont=SymbolsNerdFont
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set ttyfast " Speed up scrolling in Vim`:wq
let g:kite_supported_languages = ['python', 'javascript']

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
"Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/indentpython.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:bargreybars_auto=0
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
let g:airline#extensions#tagbar#enabled = 1
let NERDTreeQuitOnOpen=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = '#'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = '#'
" Disable whitespace warnings
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_warn_about_trailing_whitespace = 0
"let g:ale_warn_about_missing_whitespace = 0
"let g:ale_warn_about_trailing_blank_lines = 0
function! s:runpyscript()
  :w
  :term python3 % exit
endfunction
command Run call s:runpyscript()

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
map <F2> :Run<CR>
