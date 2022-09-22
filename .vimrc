let g:ale_disable_lsp = 1

"""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
set smartcase

" highlight search results (after pressing Enter)
set hlsearch

" highlight all pattern matches WHILE typing the pattern
set incsearch

"""""""""""""""""""""""""""""""""""""
" Mix
"""""""""""""""""""""""""""""""""""""
" show the mathing brackets
set showmatch

" filetpye on, need to nerd commenter
filetype plugin on


" turn hybrid line numbers on
set number relativenumber
set nu rnu


" Give more space for displaying messages.
set cmdheight=2

" Allow deleting
set backspace=2

" Tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Faster loading of stuff
set updatetime=100

""""""""""""""""""""""""""""""""""""
" Panes
"""""""""""""""""""""""""""""""""""""

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


" Mouse support
set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Fuzzy finder
Plug 'preservim/nerdcommenter'    " Good commenting out
Plug 'vim-airline/vim-airline'      " Info bar at the bottom
Plug 'vim-airline/vim-airline-themes' " not sure this is worth it 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'          " Let vim fugitive open GH
Plug 'airblade/vim-gitgutter' " icons to show adds, deletes and changes

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " so much stuff

Plug 'fatih/vim-go' " go support 
Plug 'SirVer/ultisnips' " great snippets

Plug 'joshdick/onedark.vim'

Plug 'ryanoasis/vim-devicons' " Cute icons

Plug 'tpope/vim-surround' " Bracket shortcust

Plug 'vim-test/vim-test'

call plug#end()


" Code completion
let g:coc_global_extensions = [ 'coc-tsserver' ]

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>fa <Plug>(coc

" GitGutter goto hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

""""""""""""""""""""""""""""""
" CoC (Conquor completion) """
""""""""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Formatting selected code.
xmap <C-f>  <Plug>(coc-format-selected)
nmap <C-f>  <Plug>(coc-format-selected)

" Airline bar theme
let g:airline_theme='bubblegum'

" Colourscheme
syntax on
colorscheme onedark

" Clear search highlight with escape
"nnoremap <esc> :noh<return><esc>

" Nerdtree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Toggle NERDtree
nnoremap <silent>tt :NERDTreeToggle<CR>

" Command to go to NERDTree window
nnoremap <silent>tg :NERDTreeFocus<CR>

" Not sure I need this, don't know brackets around filetype icons in nerdtree
let g:webdevicons_conceal_nerdtree_brackets = 1

" Command to reveal current file in nerdtree
nnoremap <silent>tr :NERDTreeFind<CR>

let NERDTreeShowHidden=1

" Font
set encoding=utf8

let g:airline_powerline_fonts = 1


if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Fuzzy search

nnoremap <C-p> :Files<CR>


"" Golang

" running tests

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>

let test#strategy = "vimterminal"


" run go imports on file save
let g:go_fmt_command = "goimports"

" \t runs tests
"" autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)

" \tt runs just the one test
"" autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)

" \i show sig of function
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)

" \ii show interfaces it implements
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)

" \id show def of type
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)

" \c show callers
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)

" \cr show references
nmap <leader>cr <Plug>(coc-references)

" \lf
autocmd BufEnter *.go nmap <leader>lf <Plug>(go-decls)

" highlight stuff in go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"" let g:go_auto_sameids = 1
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

autocmd BufEnter *.go nmap <C-s> :GoDeclsDir<CR>
autocmd BufEnter *.go nmap <leader>s :GoDecls<CR>

" snippets jumping
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" terminal escape
tnoremap <leader><Esc> <C-\><c-n>
tnoremap  <leader>q <C-W><C-C>

" terminal move tab
tnoremap <C-BS> <C-W>p

"let g:vimspector_enable_mappings = 'HUMAN'

" Init vimspector
" packadd! vimspector


" debugger window configuration
let g:go_debug_windows = {
            \ 'vars':       'leftabove 50vnew',
            \ 'out':        'botright 5new',
  \ }

" debugger configuration
let g:go_debug_mappings = {
      \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
      \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
      \ '(go-debug-step)': {'key': 's'},
      \ '(go-debug-print)': {'key': 'p'},
  \}

map <leader>dt :GoDebugTest<cr>
map <leader>dd :GoDebugStop<cr>
map <leader>db :GoDebugBreakpoint<cr>

" always show go function signature
let g:go_auto_type_info=1

