set fileencoding=utf-8 fileformat=unix

"dein---{{{
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/higashi/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.toml/dein.toml', {'lazy' : 0})
  call dein#end()
  call dein#save_state()
endif

"vital.vimm
if dein#tap('vital.vim')
  let g:vitalizer#vital_dir = dein#get('vital.vim').rtp
endif

if dein#check_install()
  call dein#install()
endif
"}}}

" colorscheme---{{{
syntax enable
colorscheme iceberg
set background=dark
"}}}

" CursorHold timing
set updatetime=1000

" indent setting {{{
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set cindent
" if .py file open
augroup PythonIndent
  autocmd!
  autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}}

" highlight in search result
set hlsearch
" highlight in cursor line, col
set cursorline
set cursorcolumn
" folding setting
set foldmethod=marker

set backspace=indent,eol,start

set nostartofline

" buffer move
noremap <silent><Space>x :bdelete<CR>
noremap <silent><Space>h :bprevious<CR>
noremap <silent><Space>l :bnext<CR>

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

source ~/.slacktoken.vim

set runtimepath+=/home/higashi/sarahck.vim
set runtimepath+=/home/higashi/code/sleahck.vim
set runtimepath+=/home/higashi/code/no-kyoju-no.vim
set runtimepath+=/home/higashi/code/opensiv3d.vim

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
augroup lineNumber
  autocmd!
  autocmd CursorMoved,CursorMovedI * call SetLineNumber(1)
  autocmd CursorHold,CursorHoldI * call SetLineNumber(0)
augroup END

function! SetLineNumber(whichOpt)
  if a:whichOpt
    set relativenumber
    set nonumber
    highlight LineNr ctermfg=166
  else
    set number
    set norelativenumber
    highlight LineNr ctermfg=239
  endif
endfunction
" }}}

" plugin update command
command UpdatePlugin call dein#update()

" vim-json
let g:vim_json_syntax_conceal = 0

" winresizer
let g:winresizer_start_key = '<C-T>'

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" asyncomplete
let g:asyncomplete_auto_popup = 1

" NERDTree
noremap <silent> <C-n> :NERDTreeToggle<CR>

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

" VimScript
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))

" golang
if executable('gopls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'golang',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ 'workspace_config': {'gopls': {
      \     'staticcheck': v:true,
      \     'completeUnimported': v:true,
      \     'caseSensitiveCompletion': v:true,
      \     'usePlaceholders': v:true,
      \     'completionDocumentation': v:true,
      \     'watchFileChanges': v:true,
      \     'hoverKind': 'SingleLine',
      \   }},
      \ })
endif

" dlang
if executable('dls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'dls',
      \ 'cmd': {server_info->['dls']},
      \ 'whitelist': ['d'],
      \ })
endif

" C, C++
if executable('ccls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'whitelist': ['c', 'cpp'],
      \ })
endif

" python
if executable('pyls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
endif

" javascript & typescript
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
      \ })
endif

" Ruby
if executable('solargraph')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['rb'],
        \ })
endif
" }}}

" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
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

" gina.vim
noremap <Left> :Gina add %

" autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1
