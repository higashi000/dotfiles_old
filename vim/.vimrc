set fileencoding=utf-8 fileformat=unix

set number

set runtimepath+=/home/higashi/go/src/github.com/higashi000/vim-acqua/

" vim-plug {{{
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-jp/vimdoc-ja'
"Plug 'prabirshrestha/asyncomplete-necovim.vim'
"Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'simeji/winresizer'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'osyo-manga/vim-anzu'
Plug 'elzr/vim-json'
Plug 'skanehira/translate.vim'
Plug 'cohama/lexima.vim'
"Plug 'mattn/vim-lexiv'
Plug 'mattn/webapi-vim'
Plug 'liuchengxu/vim-clap'
Plug 'rust-lang/rust.vim'
Plug 'lambdalisue/gina.vim'
Plug 'w0ng/vim-hybrid'
Plug 'taigacute/gruvbox9'
Plug 'rbtnn/vim-mrw'
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
Plug 'Shougo/echodoc.vim'
Plug 'mattn/vim-goimports'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/vim-sonictemplate'
Plug 'lambdalisue/fern.vim'
Plug 'thinca/vim-quickrun'

call plug#end()
" }}}

" colorscheme---{{{
syntax enable
colorscheme iceberg
set background=dark
"}}}

" CursorHold timing
"set updatetime=1000

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
"set timeout timeoutlen=50

" highlight in search result
set hlsearch
" highlight in cursor line, col
set cursorline
set cursorcolumn
" folding setting
set foldmethod=marker

set backspace=indent,eol,start

set helplang=ja

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
"source ~/.slacktoken.vim

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

" plugin update command
command UpdatePlugin call dein#update()

" vim-json
let g:vim_json_syntax_conceal = 0

" winresizer
let g:winresizer_start_key = '<C-T>'

" asyncomplete
let g:asyncomplete_auto_popup = 1

" NERDTree
"noremap <silent> <C-n> :NERDTreeToggle<CR>

noremap <silent> <C-n> :Fern . -drawer<CR>

" fila.vim
"noremap <silent> <C-n> :Fila<CR>

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
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
"    \ 'name': 'necovim',
"    \ 'whitelist': ['vim'],
"    \ 'completor': function('asyncomplete#sources#necovim#completor'),
"    \ }))

" asyncomplete-file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

let g:lsp_settings = {
\  'clangd': {'cmd': ['ccls']}
\}
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
noremap <Up> :Gina push<CR>
noremap <Down> :vs<CR> :Gina diff<CR>

" autofmt
set formatexpr=autofmt#japanese#formatexpr()
let autofmt_allow_over_tw=1

" echodoc.vim
set cmdheight=2
let g:echodoc#enable_at_startup = 1

nmap <unique> <c-y><c-b> <plug>(sonictemplate-postfix)

" rus.vim
let g:rustfmt_autosave = 1

set runtimepath+=/home/higashi/go/src/github.com/higashi000/vim-diacord/

" QuickRun
noremap <silent> <Leader>q :QuickRun<CR>

" sonictemplate.vim
let g:sonictemplate_vim_template_dir = expand('~/dotfiles/vim/template')

