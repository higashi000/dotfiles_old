set fileencoding=utf-8 fileformat=unix

" vim-plug {{{
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'Shougo/neco-vim'
Plug 'simeji/winresizer'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'osyo-manga/vim-anzu'
Plug 'elzr/vim-json'
Plug 'skanehira/translate.vim'
Plug 'fatih/vim-go'
Plug 'cohama/lexima.vim'
Plug 'mattn/webapi-vim'
Plug 'liuchengxu/vim-clap'
Plug 'lambdalisue/gina.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deol.nvim'
Plug 'w0ng/vim-hybrid'
Plug 'taigacute/gruvbox9'
Plug 'cocopon/iceberg.vim'
Plug 'cespare/vim-toml'
Plug 'vim-jp/vital.vim'
Plug 'tpope/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deol.nvim'
Plug 'vim/killersheep'
Plug 'airblade/vim-gitgutter'
Plug 'vim-jp/autofmt'
Plug 'andymass/vim-matchup'
Plug 'cocopon/vaffle.vim'
Plug 'higashi000/opensiv3d.vim'
Plug 'lambdalisue/fila.vim'

call plug#end()
" }}}

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

" decision command time
set timeout timeoutlen=50

" highlight in search result
set hlsearch
" highlight in cursor line, col
set cursorline
set cursorcolumn
" folding setting
set foldmethod=marker

set backspace=indent,eol,start

"clipboard
set clipboard^=unnamedplus

set nostartofline

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

" sarahck.vim
set runtimepath+=/home/higashi/vimplugin/sarahck.vim
source ~/.slacktoken.vim

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
"noremap <silent> <C-n> :NERDTreeToggle<CR>

" fila.vim
noremap <silent> <C-n> :Fila<CR>

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
"if executable('ccls')
"  au User lsp_setup call lsp#register_server({
"      \ 'name': 'ccls',
"      \ 'cmd': {server_info->['ccls']},
"      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'whitelist': ['c', 'cpp'],
"      \ })
"endif

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

"rust
if executable('rls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'rls',
      \ 'cmd': {server_info->['rls']},
      \ 'whitelist': ['rust'],
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
noremap <Left> :Gina add %<CR>
noremap <Right> :Gina commit %<CR>

" autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1
