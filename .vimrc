" ===========================
" Plugin Manager: vim-plug
" ===========================
call plug#begin('~/.vim/plugged')

" UI & Theme
Plug 'morhetz/gruvbox'                 " Colorscheme
Plug 'vim-airline/vim-airline'         " Status line
Plug 'vim-airline/vim-airline-themes'  " Airline themes
Plug 'yuttie/comfortable-motion.vim'


" Explorer / Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" ===========================
" Basic Settings
" ===========================
syntax on
set number
set cursorline
set encoding=utf-8
set termguicolors
set background=dark

" Colorscheme
colorscheme gruvbox

autocmd BufEnter * silent! call system('~/vim_rpc.sh ' . shellescape(expand("%:t")))
" ===========================
" Airline Configuration
" ===========================
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" If you install Nerd Fonts, Airline will show nice symbols
" Example font: FiraCode Nerd Font or JetBrainsMono Nerd Font

" ===========================
" Keymaps
" ===========================
let mapleader=" "

" Toggle NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

" FZF search
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>

" ===========================
" Misc
" ===========================
set clipboard=unnamedplus
set hidden
set mouse=a
set wildmenu
set showcmd
