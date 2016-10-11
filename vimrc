" PATHOGEN

execute pathogen#infect()

" VIM

set hidden
set mouse=a
set encoding=utf-8

set relativenumber 
set number

syntax on
filetype plugin indent on

inoremap jk <ESC>

let mapleader = "\<Space>"

nmap <leader>l :set invrelativenumber<CR>

map <leader>ws :split<CR>
map <leader>wv :vsplit<CR>
map <leader>wc :q<CR>
map <leader>wC :q!<CR>
map <leader>wh <C-w><C-h>
map <leader>wj <C-w><C-j>
map <leader>wk <C-w><C-k>
map <leader>wl <C-w><C-l>

map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
map <leader>th :tabnext<CR>
map <leader>tl :tabprev<CR>

nmap <leader>bl :bnext<CR>
nmap <leader>bh :bprevious<CR>
nmap <leader>bc :bd<CR>

nmap <leader>s :copen \| noautocmd vim // **/*<left><left><left><left><left><left>

nmap <leader>co :copen<CR>
nmap <leader>cc :cclose<CR>
nmap <leader>c0 :cfirst<CR>
nmap <leader>cn :cnext<CR>
nmap <leader>cN :cprev<CR>
nmap <leader>cf :cnfile<CR>
nmap <leader>cF :cpfile<CR>

nmap <leader>lo :lopen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>l0 :lfirst<CR>
nmap <leader>ln :lnext<CR>
nmap <leader>lN :lprev<CR>
nmap <leader>lf :lnfile<CR>

" APPEARANCE

colorscheme seti

hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi Pmenu ctermbg=8

set colorcolumn=81
set noshowmode

" CTRLP

nmap <leader>p :CtrlPMRUFiles<CR>
nmap <leader>P :CtrlPBuffer<CR>

" NEOCOMPLETE

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
set completeopt-=preview

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible()
		\ ? "\<C-y>"
		\ : delimitMate#ExpandReturn()
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" NEOSNIPPET

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-go/gosnippets/snippets'

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

imap <expr><TAB> pumvisible()
	\ ? "\<C-n>"
	\ : neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)"
		\ : "\<TAB>"

if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" ECHODOC

let g:echodoc_enable_at_startup = 1

" AIRLINE

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" SYNTASTIC

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" EDITORCONFIG

let g:EditorConfig_core_mode = 'external_command'

" GOLANG

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_snippet_engine = "neosnippet"
let g:go_loaded_gosnippets = 1

au FileType go nmap <leader>mr <Plug>(go-run)
au FileType go nmap <leader>mt <Plug>(go-test)
" GoCoverageToggle messes up colors, so reload vimrc
au FileType go nmap <leader>mc :GoCoverageToggle<CR>:colorscheme seti<CR>
au FileType go nmap <Leader>md <Plug>(go-def)
au FileType go nmap <Leader>mg <Plug>(go-doc)
au FileType go nmap <Leader>mb <Plug>(go-doc-browser)
au FileType go nmap <Leader>mi <Plug>(go-implements)
au FileType go nmap <Leader>me <Plug>(go-rename)
au FileType go nmap <Leader>ma <Plug>(go-alternate-edit)
au FileType go nmap <Leader>ms :GoDeclsDir<CR>

" JAVASCRIPT

let g:syntastic_javascript_checkers = ['eslint']

" workaround nerdtree/syntastic compatibility issue
noremap :w<CR> :w<CR>:SyntasticCheck<CR>
