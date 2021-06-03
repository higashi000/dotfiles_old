set fileencoding=utf-8 fileformat=unix

set number

source ~/.github_token.vim

" dein.vim --- {{{
if &compatible
    set nocompatible
endif

set runtimepath+=/home/higashi/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/higashi/.cache/dein')
    call dein#begin('/home/higashi/.cache/dein')

    call dein#add('/home/higashi/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('higashi000/vim-acqua')
    call dein#add('Shougo/deoppet.nvim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deol.nvim')
    call dein#add('Shougo/defx.nvim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('lighttiger2505/deoplete-vim-lsp')
    call dein#add('mattn/vim-lsp-settings')
    call dein#add('mattn/vim-sonictemplate')
    call dein#add('Yggdroot/indentLine')
    call dein#add('kristijanhusak/defx-icons')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('elzr/vim-json')
    call dein#add('lambdalisue/gina.vim')
    call dein#add('rbtnn/vim-mrw')
    call dein#add('cocopon/iceberg.vim')
    call dein#add('cespare/vim-toml', {'on_ft': ['toml']})
    call dein#add('vim-jp/vital.vim')
    call dein#add('tpope/vim-markdown', {'on_ft': ['markdown']})
    call dein#add('kannokanno/previm')
    call dein#add('rhysd/vim-clang-format')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'smarty']})
    call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-jp/autofmt')
    call dein#add('mattn/vim-goimports')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('thinca/vim-quickrun')
    call dein#add('vim-jp/vimdoc-ja')
    call dein#add('pechorin/any-jump.vim')
    call dein#add('lambdalisue/readablefold.vim')
    call dein#add('lambdalisue/vim-backslash', {'on_ft': ['vim']})
    call dein#add('higashi000/vimvimsemi')
    call dein#add('leafgarland/typescript-vim', {'on_ft': ['typescript']})
    call dein#add('peitalin/vim-jsx-typescript', {'on_ft': ['typescriptreact']})
    call dein#add('prettier/vim-prettier', {'build': 'yarn install'})
    call dein#add('lambdalisue/vim-findent')
    call dein#add('ujihisa/neco-look', {'on_ft': ['text', 'markdown']})
    call dein#add('mattn/webapi-vim')
    call dein#add('tyru/open-browser.vim')
    call dein#add('vim-denops/denops.vim')
    call dein#add('vim-denops/denops-helloworld.vim')
    call dein#add('higashi000/dps-loadfilesample')
    call dein#add('dart-lang/dart-vim-plugin', {'on_ft': ['dart']})
    call dein#add('udalov/kotlin-vim', {'on_ft': ['kotlin']})
    call dein#add('lambdalisue/pastefix.vim')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
        call dein#add('osyo-manga/vim-anzu')
    endif

    call dein#end()
    call dein#save_state()
endif

command DeinUpdate :call dein#check_update(v:true)

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
"}}}

" indent setting {{{
set shiftwidth=4
set tabstop=4
set softtabstop=4
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

set tabline=2

" undo
if has("persistent_undo")
    set undodir=~/.undodir
    set undofile
endif
" enable backspace
set backspace=indent,eol,start

" vim-jp/vimdoc_ja
set helplang=ja,en

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"clipboard
set clipboard^=unnamedplus

" spell check
augroup SpellCheck
    autocmd!
    autocmd FileType text setlocal spell spelllang=en_us spelloptions+=camel
    "    autocmd FileType markdown setlocal spell spelllang=en_us spelloptions+=camel
augroup END

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

" set leaderkey
let mapleader = "\<Space>"

" `;` to ':' in normal mode
noremap ; :

" escape terminal mode
tnoremap <C-[> <C-\><C-n>

" turn back
noremap j gj
noremap k gk

nnoremap <Left>  :Gina diff<CR>
nnoremap <Up>    :Gina status<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1
let g:previm_open_cmd = 'google-chrome'

" vim-lsp Document Diagnostics
let g:lsp_signs_error = {'text': '❎'}
let g:lsp_signs_warning = {'text': '▲'}

" complement setting {{{
" vim-lsp command
nnoremap <silent> <Leader>d :LspDefinition<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
nnoremap <silent> <Leader>h :LspHover<CR>
nnoremap <silent> <Leader>r :LspRename<CR>
nnoremap <silent> <Leader>a :LspCodeAction<CR>
nnoremap <silent> <Leader>ne :LspNextError<CR>
nnoremap <silent> <Leader>pe :LspPreviousError<CR>
nnoremap <silent> <Leader>td :LspTypeDefinition<CR>

let g:lsp_log_verbose = 0

let g:lsp_settings = {
            \ 'efm-langserver': {
            \    'disabled': 0,
            \    'allowlist': ['markdown'],
            \ }
            \ }
" }}}

" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'iceberg'
let g:airline#extensions#tabline#enabled = 1
" }}}

" anzu {{{
if !has(nvim)
    nmap n <Plug>(anzu-n-with-echo)
    nmap N <Plug>(anzu-N-with-echo)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)

    nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

    set statusline=%{anzu#search_status()}
endif
" }}}

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

" denite mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction
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

" deol.nvim
let g:deol#shell_history_path = '~/.local/share/fish/fish_history'
nnoremap df :Deol -split=floating<CR>
nnoremap dv :Deol -split=vertical<CR>
nnoremap ds :Deol -split=horizontal<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" Deoppet
call deoppet#initialize()
call deoppet#custom#option('snippets',
            \ map(globpath(&runtimepath, 'neosnippets', 1, 1),
            \     "{ 'path': v:val }"))

imap <C-k>  <Plug>(deoppet_expand)
imap <C-f>  <Plug>(deoppet_jump_forward)
imap <C-b>  <Plug>(deoppet_jump_backward)
smap <C-f>  <Plug>(deoppet_jump_forward)
smap <C-b>  <Plug>(deoppet_jump_backward)

set completeopt-=preview

"set runtimepath+=/home/higashi/go/src/github.com/higashi000/vim-denopspotify

let g:denops#script#typecheck = 1

set runtimepath+=/home/higashi/go/src/github.com/higashi000/dps-kakkonan

vmap ( <Plug>(dps_kakkonan_surround_parenthesis)
vmap { <Plug>(dps_kakkonan_surround_curly)
vmap [ <Plug>(dps_kakkonan_surround_square)
vmap " <Plug>(dps_kakkonan_surround_doublequote)
vmap ' <Plug>(dps_kakkonan_surround_singlequote)
vmap ` <Plug>(dps_kakkonan_surround_backquote)
map rp( <Plug>(dps_kakkonan_replace_parenthesis)
map rp{ <Plug>(dps_kakkonan_replace_curly)
map rp[ <Plug>(dps_kakkonan_replace_square)
map rp" <Plug>(dps_kakkonan_replace_doublequote)
map rp' <Plug>(dps_kakkonan_replace_singlequote)
map rp` <Plug>(dps_kakkonan_replace_backquote)

set runtimepath+=/home/higashi/go/src/github.com/higashi000/dps-androidbuilder
""set runtimepath+=/home/higashi/go/src/github.com/higashi000/dps-loadfilesample

let g:deoplete#enable_at_startup = 1
