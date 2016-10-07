set number

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_snippet_engine = "neosnippet"
let g:go_loaded_gosnippets = 1

au FileType go nmap <leader>mr <Plug>(go-run)
au FileType go nmap <leader>mt <Plug>(go-test)
au FileType go nmap <leader>mc <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>md <Plug>(go-def)
au FileType go nmap <Leader>mg <Plug>(go-doc)
au FileType go nmap <Leader>mb <Plug>(go-doc-browser)
au FileType go nmap <Leader>mi <Plug>(go-implements)
au FileType go nmap <Leader>mr <Plug>(go-rename)
au FileType go nmap <Leader>ma <Plug>(go-alternate-edit)

TagbarOpen
