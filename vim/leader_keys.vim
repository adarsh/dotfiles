" Run 'rake' from Vim using Turbux/Tslime methods
nnoremap <Leader>k :call Send_to_Tmux("clear && rake && notify 'rake complete'\n")<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Rotate open buffers
nnoremap <leader>r <C-W><C-R>

" Open splits faster
nmap <leader>V :vs<CR>
nmap <leader>S :sp<CR>

" Open specs faster
nmap <leader>v :AV<CR>
nmap <leader>s :AS<CR>
nmap <leader>a :A<CR>

" Save faster
nmap <leader>w :w<CR>

" Clear highlighting
nmap <leader>c :noh<CR>

" Git
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gcv :Gcommit -v<CR>
nnoremap <Leader>ga :Git add .<CR>
