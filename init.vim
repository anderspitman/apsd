augroup filetype_vue
    autocmd!
    autocmd BufReadPost *.vue setlocal filetype=vue
augroup END

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

set number
set ignorecase
set mouse=a
set colorcolumn=80
highlight ColorColumn ctermbg=6

autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4
autocmd Filetype cu setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype dart setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype sh setlocal ts=4 sts=4 sw=4
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
set expandtab
"map <F7> :syntax sync fromstart<CR>
set clipboard+=unnamedplus
