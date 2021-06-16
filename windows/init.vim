set number

let g:python3_host_prog = 'C:\Users\higashi\AppData\Local\Programs\Python\Python38-32\python'

set runtimepath+=~/dein/repos/github.com/vim-airline/vim-airline

call plug#begin('~/.vim/plugged')

Plug 'Shougo/dein.vim'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline-themes'
Plug 'osyo-manga/vim-anzu'
Plug 'elzr/vim-json'
Plug 'liuchengxu/vim-clap'
Plug 'rust-lang/rust.vim'
Plug 'lambdalisue/gina.vim'
Plug 'rbtnn/vim-mrw'
Plug 'cocopon/iceberg.vim'
Plug 'cespare/vim-toml'
Plug 'vim-jp/vital.vim'
Plug 'tpope/vim-markdown'
Plug 'kannokanno/previm'
Plug 'rhysd/vim-clang-format'
Plug 'tyru/open-browser.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'vim-jp/autofmt'
Plug 'cocopon/vaffle.vim'
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-sonictemplate'
Plug 'lambdalisue/fern.vim'
Plug 'thinca/vim-quickrun'
Plug 'vim-jp/vimdoc-ja'
Plug 'pechorin/any-jump.vim'
Plug 'lambdalisue/readablefold.vim'
Plug 'lambdalisue/vim-backslash'
Plug 'pocke/keycast.vim'
Plug 'pocke/vanner'
Plug 'higashi000/vimvimsemi'
Plug 'vim-denops/denops.vim'

call plug#end()

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

set tabline=2

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
"   " ¿¿¿¿¿¿¿¿¿¿¿¿¿NERDTree¿¿¿¿¿¿¿¿¿¿¿¿¿¿
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

" markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1

" vim-lsp Document Diagnostics
let g:lsp_signs_error = {'text': '¿'}
let g:lsp_signs_warning = {'text': '¿'}

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
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))



" }}}

" airline {{{
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
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

" QuickRun
noremap <silent> <Leader>q :QuickRun<CR>

" sonictemplate.vim
let g:sonictemplate_vim_template_dir = expand('~/dotfiles/vim/template')

" defx.nvim
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

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" dps-kakkonan surround text to backets example keymap
vmap ( <Plug>(dps_kakkonan_surround_parenthesis)
vmap { <Plug>(dps_kakkonan_surround_curly)
vmap [ <Plug>(dps_kakkonan_surround_square)
vmap " <Plug>(dps_kakkonan_surround_doublequote)
vmap ' <Plug>(dps_kakkonan_surround_singlequote)
vmap ` <Plug>(dps_kakkonan_surround_backquote)

" dps-kakkonan replace brackets example keymap
map rp( <Plug>(dps_kakkonan_replace_parenthesis)
map rp{ <Plug>(dps_kakkonan_replace_curly)
map rp[ <Plug>(dps_kakkonan_replace_square)
map rp" <Plug>(dps_kakkonan_replace_doublequote)
map rp' <Plug>(dps_kakkonan_replace_singlequote)
map rp` <Plug>(dps_kakkonan_replace_backquote)

set runtimepath+=~/dps-kakkonan
