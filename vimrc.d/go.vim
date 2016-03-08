Plug 'fatih/vim-go', { 'branch': 'master' }

au BufNewFile,BufRead *.go set ft=go nu
au FileType go nnoremap <buffer><leader>r :GoRun<CR>
au FileType go nnoremap <buffer><C-c>d :GoDef<CR>

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>rn <Plug>(go-rename)

au FileType go setlocal tabstop=4
au FileType go setlocal softtabstop=4

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
