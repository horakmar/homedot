set nocompatible              " be iMproved, required
filetype off                  " required
set background=dark

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme gruvbox

set laststatus=2
set shiftwidth=2
set tabstop=2
set expandtab
set smartcase
set smartindent
set nobackup
set fileencodings=ucs-bom,utf-8,default,latin2,cp1250
set pastetoggle=<F10>
set showcmd
set modeline
set dir=~/tmp

nnoremap <CR> :nohlsearch<CR><CR>

map <C-t> :NERDTreeToggle<CR>

" YAML, JS and HTML indentation
au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.yaml call SetYaml()
function SetYaml()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

" Python PEP 8 indentation                                                                                                                        
au BufNewFile,BufRead *.py call SetPython()
function SetPython()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
"    setlocal textwidth=79
    setlocal expandtab
    setlocal autoindent
    setlocal fileformat=unix
    setlocal number
endfunction

map <C-t> :NERDTreeToggle<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
