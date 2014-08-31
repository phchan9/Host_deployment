set hlsearch
set incsearch
set autoindent
set ruler
set showmode
set nu
set t_Co=256

"set colorcolumn=90
execute pathogen#infect()
nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr>

let python_highlight_all = 1
colorscheme peachpuff
nnoremap <silent> <F5> :NERDTree<CR>
map <S-l> :tabn<CR>
map <S-k> :tabp<CR>
syntax on

set ts=4
set sw=4
set softtabstop=4
set expandtab

" for powerline
set laststatus=2
let g:airline_powerline_fonts = 1
