"dein---{{{
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/higashi/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.toml/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.toml/colorscheme.toml', {'lazy' : 0})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
"}}}

syntax enable
set number
set title
set shiftwidth=2
set hlsearch
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

nmap <silent> <Leader>d :LspDefinition<CR>

source ~/code/sleahck.vim/plugin/sleahck.vim
source ~/code/sleahck.vim/autoload/sleahck.vim

" vim-lsp settings {{{
if executable('gopls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'gopls',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ })
endif

if executable('ccls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'whitelist': ['c', 'cpp'],
      \ })
endif

if executable('pyls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
endif

if executable('dls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'dls',
      \ 'cmd': {server_info->['dls']},
      \ 'whitelist': ['d'],
      \ })
endif
" }}}
