setlocal sw=2 sts=2 et
set number

let g:syntastic_javascript_checkers = ['eslint']

" workaround nerdtree/syntastic compatibility issue
noremap :w<CR> :w<CR>:SyntasticCheck<CR>
