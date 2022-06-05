set number
set printfont=Cica:h12
set ambiwidth=double

" dein.vim --- {{{
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/higashi/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/Users/higashi/.cache/dein')

call dein#add('/Users/higashi/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('Shougo/ddc.vim')
call dein#add('shun/ddc-vim-lsp')
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('LumaKernel/ddc-file')
call dein#add('Shougo/ddu.vim')
call dein#add('Shougo/ddu-ui-ff')
call dein#add('Shougo/ddu-filter-matcher_substring')
call dein#add('Shougo/ddu-commands.vim')
call dein#add('Shougo/ddu-source-line')
call dein#add('Shougo/ddu-kind-file')
call dein#add('Shougo/ddu-source-file')
call dein#add('Shougo/defx.nvim')
"call dein#add('kristijanhusak/defx-icons', {'on_func': 's:defx_my_settings'})
call dein#add('mattn/vim-sonictemplate')
call dein#add('lambdalisue/gin.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('itchyny/lightline.vim')
call dein#add('elzr/vim-json', {'on_ft': ['json']})
call dein#add('cocopon/iceberg.vim')
call dein#add('cespare/vim-toml', {'on_ft': ['toml']})
call dein#add('tpope/vim-markdown', {'on_ft': ['markdown']})
call dein#add('kannokanno/previm', {'on_ft': ['markdown']})
call dein#add('rhysd/vim-clang-format', {'on_ft': ['cpp', 'c']})
call dein#add('ryanoasis/vim-devicons')
call dein#add('mattn/emmet-vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-jp/autofmt', {'on_ft': ['txt']})
call dein#add('mattn/vim-goimports', {'on_ft': ['go']})
call dein#add('easymotion/vim-easymotion')
call dein#add('thinca/vim-quickrun')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('lambdalisue/readablefold.vim')
call dein#add('lambdalisue/vim-backslash', {'on_ft': ['vim']})
call dein#add('leafgarland/typescript-vim', {'on_ft': ['typescript']})
call dein#add('peitalin/vim-jsx-typescript', {'on_ft': ['typescriptreact']})
call dein#add('prettier/vim-prettier', {'on_ft': ['typescript', 'typescriptreact'], 'build': 'yarn install'})
call dein#add('lambdalisue/vim-findent')
call dein#add('ujihisa/neco-look', {'on_ft': ['text', 'markdown']})
call dein#add('vim-denops/denops.vim')
call dein#add('dart-lang/dart-vim-plugin', {'on_ft': ['dart']})
call dein#add('higashi000/dps-kakkonan')
call dein#add('udalov/kotlin-vim', {'on_ft': ['kotlin']})
call dein#add('hallzy/lightline-iceberg')

call dein#end()
call dein#save_state()

if dein#tap('vital.vim')
  let g:vitalizer#vital_dir = dein#get('vital.vim').rtp
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" }}}

" colorscheme---{{{
syntax enable
colorscheme iceberg
set background=dark
autocmd BufReadPost *kt setlocal filetype=kotlin
"}}}

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

augroup Stpl
  autocmd!
  autocmd FileType stpl set noexpandtab
augroup END
" }}}

set hlsearch
set cursorline
set cursorcolumn
set foldmethod=marker

set tabline=4
set showtabline=2

set backspace=indent,eol,start

set helplang=ja,en

set clipboard^=unnamedplus

noremap <silent><C-x> :bdelete<CR>
noremap <silent><C-h> :bprevious<CR>
noremap <silent><C-l> :bnext<CR>

set ruler
set noerrorbells
set laststatus=2

noremap <silent> <ESC><ESC> :noh<CR>

let mapleader = "\<Space>"

noremap ; :

tnoremap <C-[> <C-\><C-n>

noremap j gj
noremap k gk

let g:vim_json_syntax_conceal = 0

nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1
let g:previm_open_cmd = 'google-chrome'

nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>h :LspHover<CR>
nnoremap <silent> <Leader>r :LspRename<CR>
nnoremap <silent> <Leader>a :LspCodeAction<CR>
nnoremap <silent> <Leader>ne :LspNextError<CR>
nnoremap <silent> <Leader>pe :LspPreviousError<CR>
nnoremap <silent> <Leader>td :LspTypeDefinition<CR>

let g:lsp_log_verbose = 0

"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'iceberg'
"let g:airline#extensions#tabline#enabled = 1

" emmet-vim
let g:user_emmet_leader_key='<C-y>'

" autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1

" echodoc.vim
set cmdheight=2
let g:echodoc#enable_at_startup = 1

" QuickRun
noremap <silent> <Leader>q :QuickRun<CR>
let g:quickrun_config = {
      \     "_": {
        \        "runner": "vimproc",
        \     },
        \  }

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> t
        \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> ND
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> NF
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
endfunction
noremap <silent> <C-n> :Defx<CR>

call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ 'columns': 'indent:icons:filename:mark',
      \ })

set completeopt-=preview

let g:denops#script#typecheck = 1

set runtimepath+=/home/higashi/ghq/github.com/higashi000/dps-kakkonan
vmap ( <Plug>(dps_kakkonan_surround_parenthesis)
vmap { <Plug>(dps_kakkonan_surround_curly)
vmap [ <Plug>(dps_kakkonan_surround_square)
vmap " <Plug>(dps_kakkonan_surround_doublequote)
vmap ' <Plug>(dps_kakkonan_surround_singlequote)
vmap ` <Plug>(dps_kakkonan_surround_backquote)

let g:kakkonan_custom_brackets = {
      \ "h1": {
        \ "start": "<h1>",
        \ "finish": "</h1>"
        \ },
        \ "script": {
          \ "start": "<script>",
          \ "finish": "</script>"
          \ },
          \ "<": {
            \ "start": "<",
            \ "finish": ">"
            \ },
            \ }

map rp( <Plug>(dps_kakkonan_replace_parenthesis)
map rp{ <Plug>(dps_kakkonan_replace_curly)
map rp[ <Plug>(dps_kakkonan_replace_square)
map rp" <Plug>(dps_kakkonan_replace_doublequote)
map rp' <Plug>(dps_kakkonan_replace_singlequote)
map rp` <Plug>(dps_kakkonan_replace_backquote)
map <Leader>dk <Plug>(dps_kakkonan_delete_brackets)

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

let g:dart_format_on_save=1

call ddc#custom#patch_global('sources', ['vim-lsp', 'file', 'around'])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
        \ 'matchers': ['matcher_head'],
        \ 'sorters': ['sorter_rank'],
        \ },
        \ 'ddc-vim-lsp': {
          \ 'matchers': ['matcher_head'],
          \ 'mark': 'L',
          \ 'isVolatile': v:true,
          \ 'forceCompletionPatttern': '\.',
          \ 'minAutoCompleteLength': 0,
          \ },
          \ 'file': {
            \   'mark': 'F',
            \   'isVolatile': v:true,
            \   'forceCompletionPattern': '\S/\S*',
            \ },
            \ 'around': {
              \ 'mark': 'A',
              \ 'isVolatile': v:true,
              \ },
              \ })


call ddc#custom#patch_filetype(
      \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
        \ 'sourceOptions': {
          \   'file': {
            \     'forceCompletionPattern': '\S\\\S*',
            \   },
            \ },
            \ 'sourceParams': {
              \   'file': {
                \     'mode': 'win32',
                \   },
                \ }})


call ddc#enable()

call ddu#custom#patch_global({
      \ 'ui': 'ff',
      \ 'uiParams': {
        \ 'ff': {
          \ 'split': 'floating',
          \ 'startFilter': v:true,
          \ },
          \ }
          \ })

call ddu#custom#patch_global({
      \ 'kindOptions': {
        \ 'file': {
          \ 'defaultAction': 'open',
          \ },
          \ }
          \ })

call ddu#custom#patch_global({
      \ 'sourceOptions': {
        \ '_': {
          \ 'matchers': ['matcher_substring'],
          \ }
          \ }
          \ })

call ddu#custom#patch_global('sourceParams', {
      \ 'file': {'path': expand("%")},
      \ })


autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
        \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
        \ <Cmd>close<CR>
endfunction

let g:lightline = {
        \ 'colorscheme': 'iceberg',
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ],
        \ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
        \ 'component_function': {
        \   'readonly': 'LightLineReadonly',
        \   'modified': 'LightLineModified',
        \   'filename': 'LightLineFilename',
        \   'filetype': 'LightLineFiletype',
        \   'fileformat': 'LightLineFileformat',
        \   'gitbranch': 'GetNowBranch',
        \ },
        \ }

let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 1,
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ''._ : ''
    endif
    return 
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return 1000
endfunction

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator
