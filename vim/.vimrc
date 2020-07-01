set fileencoding=utf-8 fileformat=unix

set number

" dein.vim --- {{{
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/higashi/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/dotfiles/vim/toml/dein.toml', {'lazy' : 0})
  call dein#add('lambdalisue/readablefold.vim')
  call dein#add('lambdalisue/vim-backslash')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" }}}

" colorscheme---{{{
syntax enable
colorscheme iceberg
set background=dark
"}}}

" indent setting {{{
set shiftwidth=3
set tabstop=3
set softtabstop=3
set expandtab
set smarttab
set cindent
" if .py file open
augroup PythonIndent
  autocmd!
  autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup Stpl
  autocmd!
  autocmd FileType stpl set noexpandtab
augroup END
" }}}

" highlight in search result
set hlsearch
" highlight in cursor line, col
set cursorline
set cursorcolumn
" folding setting
set foldmethod=marker

" enable backspace
set backspace=indent,eol,start

" vim-jp/vimdoc-ja
set helplang=ja,en

"clipboard
set clipboard^=unnamedplus

" spell check
"setlocal spell spelllang=en_us
"set spelloptions+=camel

"set nostartofline

" buffer move
noremap <silent><C-x> :bdelete<CR>
noremap <silent><C-h> :bprevious<CR>
noremap <silent><C-l> :bnext<CR>

" display cursor pos
set ruler
" error bell
set noerrorbells
" status line
set laststatus=2

" highlight cancel
noremap <silent> <ESC><ESC> :noh<CR>

" `s;;` to `std::`
inoremap s;; std::

" set leaderkey
let mapleader = "\<Space>"

" `;` to ':' in normal mode
noremap ; :

" escape terminal mode
tnoremap <C-[> <C-\><C-n>

" turn back
noremap j gj
noremap k gk

" " auto save --- {{{
" augroup autoSave
"   autocmd!
"   autocmd CursorHold,CursorHoldI * call Higashi000AutoSave()
" augroup END
"
" " auto save
" function! Higashi000AutoSave()
"   " ファイル名がついていないかNERDTreeを開いていたら自動保存しない
"   let notAutoSavePattern = '\v^NERD_tree_\v\d*|\v^\v$'
"   if match(expand('%'), notAutoSavePattern) != 0 && !&readonly
"     :w
"   endif
" endfunction
" " }}}

" line number {{{
"augroup lineNumber
"  autocmd!
"  autocmd CursorMoved,CursorMovedI * call SetLineNumber(1)
"  autocmd CursorHold,CursorHoldI * call SetLineNumber(0)
"augroup END
"
"function! SetLineNumber(whichOpt)
"  if a:whichOpt
"    set relativenumber
"    set nonumber
"    highlight LineNr ctermfg=166
"  else
"    set number
"    set norelativenumber
"    highlight LineNr ctermfg=239
"  endif
"endfunction
" }}}

" Respect for https://github.com/yukiycino-dotfiles/dotfiles/blob/master/.vimrc {{{
nnoremap <Left>  :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up>    :resize -1<CR>
nnoremap <Down>  :resize +1<CR>
" }}}

" plugin update command
command UpdatePlugin call dein#update()

" vim-json
let g:vim_json_syntax_conceal = 0

" asyncomplete
let g:asyncomplete_auto_popup = 1

" fern.vim
noremap <silent> <C-n> :Fern . -drawer<CR>

" markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1

" vim-lsp Document Diagnostics
let g:lsp_signs_error = {'text': '❎'}
let g:lsp_signs_warning = {'text': '▲'}

" complement setting {{{
" vim-lsp command
nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>h :LspHover<CR>
nnoremap <silent> <Leader>r :LspRename<CR>
nnoremap <silent> <Leader>ne :LspNextError<CR>
nnoremap <silent> <Leader>pe :LspPreviousError<CR>
nnoremap <silent> <Leader>td :LspTypeDefinition<CR>

" asyncomplete-file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" }}}

" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'iceberg'
let g:airline#extensions#tabline#enabled = 1
" }}}

" anzu {{{
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}

" emmet-vim
let g:user_emmet_leader_key='<C-y>'

" autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1

" echodoc.vim
set cmdheight=2
let g:echodoc#enable_at_startup = 1

" rust.vim
let g:rustfmt_autosave = 1

set runtimepath+=/home/higashi/go/src/github.com/higashi000/vim-diacord/

" QuickRun
noremap <silent> <Leader>q :QuickRun<CR>

" sonictemplate.vim
let g:sonictemplate_vim_template_dir = expand('~/dotfiles/vim/template')
