" PATHOGEN

execute pathogen#infect()

" VIM

set hidden
set mouse=a
set encoding=utf-8

syntax on
filetype plugin indent on

inoremap jk <ESC>

let mapleader = "\<Space>"

nmap <leader>p <C-p>

nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bd :bd
nmap <leader>bD :bd<CR>

nmap <leader>ss :noautocmd vim // **/*<left><left><left><left><left><left>
nmap <leader>so :copen<CR>
nmap <leader>sc :cclose<CR>
nmap <leader>s0 :cfirst<CR>
nmap <leader>sn :cnext<CR>
nmap <leader>sN :cprev<CR>
nmap <leader>sf :cnfile<CR>
nmap <leader>sF :cpfile<CR>

" APPEARANCE

colorscheme seti

hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi Pmenu ctermbg=8

set colorcolumn=81
set noshowmode

" NEOCOMPLETE

let g:neocomplete#enable_at_startup = 1
set completeopt-=preview

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" ECHODOC

let g:echodoc_enable_at_startup = 1

" NEOSNIPPET

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-go/gosnippets/snippets'

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
	set conceallevel=2 concealcursor=niv
endif"

" NERDTREE

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <leader>tf :NERDTreeToggle<CR>


" TAGBAR

nmap <leader>tt :TagbarToggle<CR>

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


