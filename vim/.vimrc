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

" タブ関係 {{{
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set cindent
" if .py file open
augroup PythonIndent
  autocmd!
  autocmd FileType python set tabstop = 4 softtabstop = 4 shiftwidth = 4
augroup END
" }}}

" 検索結果をハイライト
set hlsearch
" カーソル行、列をハイライト
set cursorline
set cursorcolumn
" 折りたたみ有効化
set foldmethod=marker

set ruler
" エラーを鳴らさない
set noerrorbells
" ステータスラインをいい感じに
set laststatus=2

" <ESC><ESC>でハイライトをやめる
noremap <silent> <ESC><ESC> :noh<CR>
" s;;でstd::を入力
inoremap s;; std::
" リーダーキーをスペースに
let mapleader = "\<Space>"
" ノーマルモードで;を:に
noremap ; :
" ターミナルモードを抜けるときに<C-[>で行けるように
tnoremap <C-[> <C-\><C-n>
" <Leader>tでディレクトリツリーの表示
nmap <silent> <Leader>t :e.<CR>

" 折返し
noremap j gj
noremap k gk

source ~/.slacktoken.vim
source ~/sarahck.vim/autoload/sarahck.vim
source ~/sarahck.vim/plugin/sarahck.vim


" 自動保存 --- {{{
augroup autoSave
  autocmd!
  autocmd CursorHold,CursorHoldI * call CheckFileName()
augroup END

function! CheckFileName()
  if expand("%") != ''
    :w
  endif
endfunction
" }}}

" 行番号の表示切り替え {{{
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

" プラグインアップデート
command UpdatePlugin call dein#update()

" vim-json
let g:vim_json_syntax_conceal = 0

" winresizer
let g:winresizer_start_key = '<C-T>'

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:asyncomplete_auto_popup = 1

" 補完系の設定 {{{
" vim-lsp command
nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>h :LspHover<CR>
nnoremap <silent> <Leader>r :LspRename<CR>
nnoremap <silent> <Leader>ne :LspNextError<CR>
nnoremap <silent> <Leader>pe :LspPreviousError<CR>
nnoremap <silent> <Leader>td :LspTypeDefinition<CR>

" vim-lsp Document Diagnostics
let g:lsp_signs_error = {'text': '❎'}
let g:lsp_signs_warning = {'text': '🔼'}

" VimScript
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))

" golang
if executable('gopls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'gopls',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
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
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif

" Ruby
if executable('solargraph')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif
" }}}

" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1

noremap <silent><Space>x :bdelete<CR>
noremap <silent><Space>h :bprevious<CR>
noremap <silent><Space>l :bnext<CR>
" }}}

" anzu {{{
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}
