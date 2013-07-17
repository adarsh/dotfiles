" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Run a quick 'git diff'
nnoremap <Leader>d :call Send_to_Tmux("gd\n")<CR>

" Factories File
map <Leader>f :e spec/support/factories.rb<CR>

" Run 'rake' from Vim using Turbux/Tslime methods
nnoremap <Leader>k :call Send_to_Tmux("clear && rake && notify 'rake complete'\n")<CR>

" Create a work-in-progress commit
nnoremap <Leader>w :call Send_to_Tmux("gaa && gcm 'wip' && git push")<CR>

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

" Close a pane
nmap <leader>q :q<CR>

" Git
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gcv :Gcommit -v<CR>
nnoremap <Leader>ga :Git add .<CR>

" Refresh CtrlP cache and enter search mode
map <Leader>cp :CtrlPClearCache<CR><C-P>

" Paste in paste mode
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
