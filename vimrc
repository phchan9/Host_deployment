set hlsearch
set incsearch
set autoindent
set ruler
set showmode
set cursorline
set autoread
set nu
set t_Co=256
syntax on

"set colorcolumn=90

"Pathogen 
execute pathogen#infect()

"Single Compile
nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr>

let python_highlight_all = 1
colorscheme peachpuff

"NerdTree
nnoremap <silent> <F5> :NERDTree<CR>
map <S-l> :tabn<CR>
map <S-k> :tabp<CR>

"search selected word in viusal word by pressing //
vmap // y/<C-R>"<CR>  

"Tab 
""Depends on which filetype to apply different plugin 
filetype indent plugin on 
set ts=4
set sw=4
set softtabstop=4
set expandtab

"Display invisible character, :set list(sometimes for line break & tab)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" for powerline
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
" for airline plugin for powerline
let g:airline_powerline_fonts = 1

"Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  endif

"Edit vimrc on the fly
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

