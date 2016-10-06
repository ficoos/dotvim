set number

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-go/gosnippets/snippets'
let g:go_loaded_gosnippets = 1
let g:go_snippet_engine = "neosnippet"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>d <Plug>(go-def-split)
au FileType go nmap <Leader>g <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>a <Plug>(go-alternate-edit)

TagbarOpen
