set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
" Installed plugins:
" FastFold ... https://github.com/Konfekt/FastFold
" gruvbox ... https://github.com/morhetz/gruvbox.git
" indentpython.vim ... https://github.com/vim-scripts/indentpython.vim
" nerdtree ... https://github.com/scrooloose/nerdtree.git
" powerline ... https://github.com/powerline/powerline
" SimpylFold ... https://github.com/tmhedberg/SimpylFold.git
" vim-fugitive ... https://github.com/tpope/vim-fugitive.git
" Vim-Jinja2-Syntax ... https://github.com/Glench/Vim-Jinja2-Syntax.git
" vim-sensible ... https://github.com/tpope/vim-sensible.git

filetype plugin indent on

colorscheme gruvbox

set background=dark
set laststatus=2
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set ignorecase
set smartcase
set smartindent
set nobackup
set fileencodings=ucs-bom,utf-8,default,latin2,cp1250
set pastetoggle=<F10>
set showcmd
set modeline

" Unhighlight after search
nnoremap <CR> :nohlsearch<CR><CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding based on indentation:
"au FileType python set foldmethod=indent
" Enable folding with the spacebar
nnoremap <space> za
" Keep docstring in fold header
let g:SimpylFold_docstring_preview = 1

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

" YAML, JS and HTML indentation
au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.yaml call SetYaml()
function SetYaml()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

" Flag bad whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Python with virtualenv support - requires vim-nox package on Ubuntu
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

map <C-t> :NERDTreeToggle<CR>
" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$']
