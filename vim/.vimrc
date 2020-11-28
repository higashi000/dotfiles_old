set fileencoding=utf-8 fileformat=unix

set number

" dein.vim --- {{{
if &compatible
  set nocompatible
endif

set runtimepath+=/home/higashi/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/higashi/.cache/dein')
   call dein#begin('/home/higashi/.cache/dein')

   call dein#add('/home/higashi/.cache/dein/repos/github.com/Shougo/dein.vim')
   call dein#add('Shougo/denite.nvim')
   call dein#add('Shougo/deoplete.nvim')
   call dein#add('Shougo/deoppet.nvim')
   call dein#add('Shougo/neosnippet-snippets')
   call dein#add('Shougo/deol.nvim')
   call dein#add('Shougo/defx.nvim')
   call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
   call dein#add('prabirshrestha/vim-lsp')
   call dein#add('mattn/vim-lsp-settings')
   call dein#add('mattn/vim-lsp-icons')
   call dein#add('mattn/vim-sonictemplate')
   call dein#add('lighttiger2505/deoplete-vim-lsp')
   call dein#add('Yggdroot/indentLine')
   call dein#add('kristijanhusak/defx-icons')
   call dein#add('bronson/vim-trailing-whitespace')
   call dein#add('vim-airline/vim-airline')
   call dein#add('vim-airline/vim-airline-themes')
   call dein#add('osyo-manga/vim-anzu')
   call dein#add('elzr/vim-json')
   call dein#add('mattn/vim-lexiv')
   call dein#add('lambdalisue/gina.vim')
   call dein#add('rbtnn/vim-mrw')
   call dein#add('cocopon/iceberg.vim')
   call dein#add('cespare/vim-toml')
   call dein#add('vim-jp/vital.vim')
   call dein#add('tpope/vim-markdown')
   call dein#add('kannokanno/previm')
   call dein#add('rhysd/vim-clang-format')
   call dein#add('ryanoasis/vim-devicons')
   call dein#add('mattn/emmet-vim')
   call dein#add('airblade/vim-gitgutter')
   call dein#add('vim-jp/autofmt')
   call dein#add('cocopon/vaffle.vim')
   call dein#add('mattn/vim-goimports')
   call dein#add('easymotion/vim-easymotion')
   call dein#add('lambdalisue/fern.vim')
   call dein#add('thinca/vim-quickrun')
   call dein#add('vim-jp/vimdoc-ja')
   call dein#add('pechorin/any-jump.vim')
   call dein#add('lambdalisue/readablefold.vim')
   call dein#add('lambdalisue/vim-backslash')
   call dein#add('higashi000/vimvimsemi')
   call dein#add('leafgarland/typescript-vim')
   call dein#add('peitalin/vim-jsx-typescript')
   call dein#add('mbbill/undotree')
   call dein#add('prettier/vim-prettier', {'build': 'yarn install'})

   if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
   endif

   call dein#end()
   call dein#save_state()
endif

"call dein#check_update(v:true)

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
"syntax enable
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

" vim-jp/vimdoc-ja
set helplang=ja,en

"clipboard
set clipboard^=unnamedplus

" spell check
"setlocal spell spelllang=en_us
"set spelloptions+=camel

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

" asyncomplete-file
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"    \ 'name': 'file',
"    \ 'whitelist': ['*'],
"    \ 'priority': 10,
"    \ 'completor': function('asyncomplete#sources#file#completor')
"    \ }))

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

" sonictempalte
let g:sonictemplate_vim_template_dir = expand('/home/higashi/dotfiles/vim/template/')

" In development plugins
set runtimepath+=~/go/src/github.com/higashi000/vim-dotvscode
set runtimepath+=~/go/src/github.com/higashi000/deoplete-sonictemplate
set runtimepath+=~/go/src/github.com/higashi000/noachat.nvim

" Deoppet
call deoppet#initialize()
call deoppet#custom#option('snippets_dirs',
\ globpath(&runtimepath, 'neosnippets', 1, 1))

imap <C-k>  <Plug>(deoppet_expand)
imap <C-f>  <Plug>(deoppet_jump_forward)
imap <C-b>  <Plug>(deoppet_jump_backward)
smap <C-f>  <Plug>(deoppet_jump_forward)
smap <C-b>  <Plug>(deoppet_jump_backward)


autocmd FileType noachat call s:noachat_settings()
let g:noachat#UserName = 'higashi'
let g:noachat#https = v:true
let g:noachat#ServerURL = 'noa.higashi.dev'
function! s:noachat_settings() abort
    map <silent> ns <PLug>(noachat_start)
    map <silent> nl <Plug>(noachat_leave)
endfunction

" undotree
nnoremap <C-u> :UndotreeToggle<CR>
