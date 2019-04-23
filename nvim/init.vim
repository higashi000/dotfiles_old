set t_u7=
set t_RV=

"dein---{{{
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/higashi/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/toml/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/toml/colorscheme.toml', {'lazy' : 0})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
"}}}

syntax enable
set title
set shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
set expandtab
set cindent
set smarttab
set cursorline
set cursorcolumn
set foldmethod=marker
set nobackup
set showmatch
set ruler
set noerrorbells
set noswapfile
set hidden
set showcmd
set laststatus=2
set clipboard+=unnamedplus
highlight Normal ctermbg=none
noremap <ESC><ESC> :noh<CR>
inoremap s;; std::
noremap ; :
tnoremap <C-[> <C-\><C-n>

command! Term call OpenTerminal()
function! OpenTerminal()
  :10sp
  :terminal
endfunc
